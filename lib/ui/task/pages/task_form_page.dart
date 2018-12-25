import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:thingstodo/theme/colors.dart';
import 'package:thingstodo/data/model/models.dart';
import 'package:thingstodo/ui/widget/form/form.dart';
import 'package:thingstodo/redux/app/app_state.dart';
import 'package:thingstodo/ui/widget/show_snack_bar.dart';
import 'package:thingstodo/ui/widget/app_bar/my_app_bar.dart';

import '../task_vm.dart';

class TaskFormPage extends StatefulWidget {
  static final String route = '/task-form';

  final BuildContext previousContext;

  TaskFormPage({ this.previousContext });

  @override
  TaskFormPageState createState() => TaskFormPageState();
}

class TaskFormPageState extends State<TaskFormPage> {
  final formKey = GlobalKey<FormState>();

  TextEditingController titleController;
  TextEditingController dateTimeController;
  TextEditingController descriptionController;
  TextEditingController categoryController;
  CategoryModel _categoryController;
  int priorityController;

  @override
  void initState() {
    super.initState();

    titleController = TextEditingController();
    descriptionController = TextEditingController();
    categoryController = TextEditingController(
      text: 'Uncategorized'
    );
    dateTimeController = TextEditingController(
      text: DateTime.now().toString()
    );
    priorityController = 0;
    _categoryController = CategoryModel((b) => b
      ..categoryId = '0'
      ..title = 'Uncategorized'
    );
  }

  Future pickCategory() async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return connector(
          builder: (BuildContext context, TaskVM vm) {
            List<Widget> children = [];

            vm.categories.forEach((category) => (
              children.add(
                SimpleDialogOption(
                  child: Text(category.title),
                  onPressed: () {
                    categoryController.text = category.title;
                    _categoryController = category;

                    Navigator.of(context).pop();
                  },
                )
              )
            ));

            children.add(
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: SimpleDialogOption(
                  child: Text('Manage Category'),
                  onPressed: () { },
                ),
              )
            );

            return SimpleDialog(
              title: const Text('Select category'),
              contentPadding: EdgeInsets.symmetric(
                vertical: 20
              ),
              children: children
            );
          }
        );
      }
    );
  }

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
      String description = descriptionController.text;
      CategoryModel category = _categoryController;
      int priority = priorityController;

      DateTime now = DateTime.now();

      String taskId = now.millisecondsSinceEpoch.toString();
      DateTime date = now.toUtc();
      var priorityList = TaskPriority.values;

      if (dateTime != '') {
        date = DateTime.parse(dateTime).toUtc();
      }

      final TaskModel newTask = TaskModel((b) => b
        ..taskId = '$taskId'
        ..date = date
        ..title = taskName
        ..categoryId = category.categoryId
        ..priority = priorityList.elementAt(priority)
        ..status = TaskStatus.active
        ..description = description
        ..important = false
      );

      // Create new task
      vm.createTask(newTask);

      // Pop to previous page
      Navigator.of(context).pop();

      // Show snackbar in privous scaffold
      showSnackBar(
        context: widget.previousContext,
        content: Text('New Task Added'),
        backgroundColor: kSuccessColor,
      );
    }
  }

  Widget connector({ builder }) {
    return StoreConnector<AppState, TaskVM>(
      converter: TaskVM.fromStore,
      builder: builder
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        context: context,
        hideSearchBar: true,
        actionButtons: ['notification'],
        elevation: 0,
      ),
      bottomSheet: formSubmitButton(context),
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
        Builder(
          builder: (BuildContext context) {
            return MyCustomField(
              controller: categoryController,
              labelText: 'Category',
              onTap: () async {
                pickCategory();
              },
            );
          }
        ),
        MyCustomField(
          controller: dateTimeController,
          labelText: 'Date & Time',
          onTap: () async {
            final value = await pickDateAndTime();

            if (value != null) {
              setState(() {
                dateTimeController.text = value.toString();
              });
            }
          },
        ),
        MySection(
          text: 'Priority'
        ),
        MyBuilderField(
          builder: (BuildContext context) {
            return Container(
              child: Row(
                children: _buildPriorityIcon()
              ),
            );
          },
        ),
        // MyCustomField(
        //   labelText: 'Notifications',
        // ),
      ],
    ),
  );

  /// [Form Submit Button]
  Widget formSubmitButton(BuildContext context) {
    return SizedBox(
      height: 50,
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

  List<Widget> _buildPriorityIcon() {
    return [0, 1, 2, 3].map((index) {
      var color = [kSuccessColor, kInfoColor, kWarningColor, kErrorColor];

      double interpolate = priorityController == index ? 0.5 : 0;

      return IconButton(
        onPressed: () {
          setState(() {
            priorityController = index;
          });
        },
        icon: Container(
          margin: EdgeInsets.all(3),
          decoration: BoxDecoration(
            color: color[index],
            border: Border.all(
              width: 3,
              color: Color.lerp(color[index], Colors.white, interpolate)
            ),
            borderRadius: BorderRadius.circular(100)
          ),
        )
      );
    }).toList();
  }
}
