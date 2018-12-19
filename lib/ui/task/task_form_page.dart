import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:intl/intl.dart';

import 'package:thingstodo/theme/colors.dart';
import 'package:thingstodo/data/model/models.dart';
import 'package:thingstodo/ui/widget/form/form.dart';
import 'package:thingstodo/redux/app/app_state.dart';
import 'package:thingstodo/ui/widget/app_bar/my_app_bar.dart';

import 'task_vm.dart';

class TaskFormPage extends StatefulWidget {
  static final String route = '/task-form';

  final BuildContext previousContext;

  TaskFormPage({ this.previousContext });

  @override
  TaskFormPageState createState() => TaskFormPageState();
}

class TaskFormPageState extends State<TaskFormPage> {
  final formKey = GlobalKey<FormState>();

  final titleController = TextEditingController();
  final categoryController = TextEditingController();
  final dateTimeController = TextEditingController();
  final descriptionController = TextEditingController();

  Future pickDateAndTime() async {
    String value = dateTimeController.text;
    print(value);

    bool isPicked = value != '';
    DateTime parsedValue = isPicked ? DateTime.parse(value) : null;

    DateTime now = new DateTime.now();
    DateTime today = new DateTime(now.year, now.month, now.day);

    final DateTime date = await showDatePicker(
      context: context,
      lastDate: DateTime(2100),
      firstDate: today,
      initialDate: isPicked ? parsedValue : DateTime.now(),
    );

    if (date != null) {
      final TimeOfDay time = await showTimePicker(
        context: context,
        initialTime: (isPicked
          ? TimeOfDay.fromDateTime(parsedValue)
          : TimeOfDay.now()
        )
      );

      if (time != null) {
        return DateTime(
          date.year,
          date.month,
          date.day,
          time.hour,
          time.minute
        );
      }
    }
  }

  handleSubmitButton(context, TaskVM vm) {
    if (formKey.currentState.validate()) {
      String taskName = titleController.text;
      String dateTime = dateTimeController.text;
      String category = categoryController.text;
      String description = descriptionController.text;

      DateTime now = DateTime.now();

      String taskId = now.millisecondsSinceEpoch.toString();
      DateTime date = now.toUtc();

      if (dateTime != '') {
        date = DateTime.parse(dateTime).toUtc();
      }

      final TaskModel newTask = TaskModel((b) => b
        ..taskId = '$taskId'
        ..date = date
        ..title = taskName
        ..category = category
        ..priority = TaskPriority.p1
        ..status = TaskStatus.active
        ..description = description
        ..important = false
      );

      // Create new task
      vm.createTask(newTask);

      // Pop to previous page
      Navigator.of(context).pop();

      // Show snackbar in privous scaffold
      Scaffold.of(widget.previousContext).showSnackBar(
        SnackBar(
          content: Text('New Task Added'),
          backgroundColor: kSuccessColor,
          duration: Duration(seconds: 1),
        )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        context: context,
        hideSearchBar: true,
      ),
      bottomNavigationBar: _formSubmitButton,
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: _form,
      )
    );
  }

  /// [Form Builder]
  Widget get _form => Form(
    key: formKey,
    child: Column(
      children: <Widget>[
        MyInputField(
          controller: titleController,
          labelText: 'Task Title',
          validator: (value) {
            if (value == '') {
              return 'Task title cannot be null \n';
            }
          },
        ),
        MyInputField(
          controller: descriptionController,
          labelText: 'Description',
          keyboardType: TextInputType.multiline,
        ),
        MyInputField(
          controller: categoryController,
          labelText: 'Category',
        ),
        MyCustomField(
          controller: dateTimeController,
          labelText: 'Date & Time',
          onTap: () async {
            final value = await pickDateAndTime();

            setState(() {
              dateTimeController.text = value.toString();
            });
          },
        ),
        MySection(
          text: 'Priority'
        ),
        MyCustomField(
          labelText: 'Date & Time',
        ),
        MyCustomField(
          labelText: 'Notifications',
        ),
      ],
    ),
  );

  /// [Form Submit Button]
  Widget get _formSubmitButton => SizedBox(
    height: 45,
    width: double.infinity,
    child: StoreConnector<AppState, TaskVM>(
      converter: TaskVM.fromStore,
      builder: (BuildContext context, vm) {
        return RaisedButton(
          onPressed: () { handleSubmitButton(context, vm); },
          child: Text(
            'ADD',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        );
      }
    )
  );
}
