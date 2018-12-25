import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:thingstodo/theme/colors.dart';
import 'package:thingstodo/data/model/models.dart';
import 'package:thingstodo/redux/app/app_state.dart';
import 'package:thingstodo/ui/widget/form/form.dart';
import 'package:thingstodo/ui/category/category_page.dart';
import 'package:thingstodo/ui/widget/app_bar/my_app_bar.dart';
import 'package:thingstodo/ui/widget/notifications/show_snack_bar.dart';

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
  DateTime _dateTimeController;
  int priorityController;

  DateFormat _formatDateTime = DateFormat('dd-mm-yyyy | hh:mm aa');

  @override
  void initState() {
    super.initState();

    titleController = TextEditingController();
    descriptionController = TextEditingController();
    priorityController = 0;
    categoryController = TextEditingController(
      text: 'Uncategorized'
    );
    _categoryController = CategoryModel((b) => b
      ..categoryId = '0'
      ..title = 'Uncategorized'
    );
    dateTimeController = TextEditingController(
      text: _formatDateTime.format(DateTime.now())
    );
    _dateTimeController = DateTime.now();
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
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => CategoryPage()
                      )
                    );
                  },
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
    DateTime value = _dateTimeController;
    print(value);

    bool isPicked = value != null;
    DateTime parsedValue = isPicked ? value : null;

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
      DateTime _dateTime = _dateTimeController;
      int priority = priorityController;

      DateTime now = DateTime.now();

      String taskId = now.millisecondsSinceEpoch.toString();
      DateTime date = now.toUtc();
      var priorityList = TaskPriority.values;

      if (dateTime != '') {
        date = _dateTime.toUtc();
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
      bottomSheet: buildFormSubmitButton(context),
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 60),
        child: buildTaskForm(),
      )
    );
  }

  /// [Form Builder]
  Widget buildTaskForm() {
    return Form(
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
                  _dateTimeController = value;
                  dateTimeController.text = _formatDateTime.format(value);
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
                  children: buildPriorityIcon()
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
  }

  Widget buildFormSubmitButton(BuildContext context) {
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

  List<Widget> buildPriorityIcon() {
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
          margin: EdgeInsets.all(6),
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
