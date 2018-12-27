import 'package:intl/intl.dart';
import 'package:redux/redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:built_collection/built_collection.dart';

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
  final TaskModel task;

  TaskFormPage({ this.previousContext, this.task });

  @override
  TaskFormPageState createState() => TaskFormPageState();
}

class TaskFormPageState extends State<TaskFormPage> {
  final formKey = GlobalKey<FormState>();

  TextEditingController titleController;
  TextEditingController dateTimeController;
  TextEditingController categoryController;
  TextEditingController descriptionController;
  CategoryModel _categoryController;
  DateTime _dateTimeController;
  String priorityController;

  DateFormat _formatDateTime = DateFormat('dd-MM-yyyy | hh:mm aa');

  @override
  didChangeDependencies() {
    super.didChangeDependencies();

    final Store<AppState> store = StoreProvider.of<AppState>(context);
    final TaskVM vm = TaskVM.fromStore(store);

    final BuiltList<CategoryModel> categories = vm.categories;
    final TaskModel task = widget.task;

    titleController = TextEditingController(
      text: task?.title ?? ''
    );
    descriptionController = TextEditingController(
      text: task?.description ?? ''
    );

    priorityController = task?.priority?.name ?? 'p1';

    var initialCategory = categories.firstWhere((category) => (
      category.categoryId == task?.categoryId
    ), orElse: () => CategoryModel((b) => b
      ..categoryId = '0'
      ..title = 'Uncategorized'
    ));

    categoryController = TextEditingController(
      text: initialCategory.title
    );
    _categoryController = initialCategory;

    var initialDate = task?.date?.toLocal() ?? DateTime.now().toLocal();
    dateTimeController = TextEditingController(
      text: _formatDateTime.format(initialDate)
    );
    _dateTimeController = initialDate;
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
      String title = titleController.text;
      String dateTime = dateTimeController.text;
      String description = descriptionController.text;
      CategoryModel category = _categoryController;
      DateTime _dateTime = _dateTimeController;
      String priority = priorityController;

      DateTime now = DateTime.now();

      String taskId = now.millisecondsSinceEpoch.toString();
      DateTime date = now.toUtc();
      var priorityList = TaskPriority.values;

      if (dateTime != '') {
        date = _dateTime.toUtc();
      }

      Widget snackbarContent;
      if (widget.task == null) {
        final TaskModel newTask = TaskModel((b) => b
          ..taskId = '$taskId'
          ..date = date
          ..title = title
          ..categoryId = category.categoryId
          ..priority = priorityList.firstWhere((p) => p.name == priority)
          ..status = TaskStatus.active
          ..description = description
          ..important = false
        );

        vm.createTask(newTask);
        snackbarContent = Text('New task added');
      } else {
        final TaskModel updates = widget.task.rebuild((b) => b
          ..date = date
          ..title = title
          ..categoryId = category.categoryId
          ..priority = priorityList.firstWhere((p) => p.name == priority)
          ..description = description
        );

        vm.updateTask(widget.task, updates);
        snackbarContent = Text('Task updates');
      }

      Navigator.of(context).pop();

      showSnackBar(
        context: widget.previousContext,
        content: snackbarContent,
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
    final String title = widget.task != null ? 'Edit Task' : 'New Task';

    return Scaffold(
      appBar: MyAppBar(
        context: context,
        title: Text(title),
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
              widget.task == null ? 'ADD' : 'SAVE',
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
      var priorityList = TaskPriority.values;
      var priority = priorityList.elementAt(index).name;
      var color = [kSuccessColor, kInfoColor, kWarningColor, kErrorColor];

      double interpolate = priorityController == priority ? 0.5 : 0;

      return IconButton(
        onPressed: () {
          setState(() {
            priorityController = priority;
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
