import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:thingstodo/data/model/models.dart';
import 'package:thingstodo/redux/app/app_state.dart';
import 'package:thingstodo/ui/widget/dialog/input_dialog.dart';

import 'category_item.dart';
import 'category_vm.dart';

class CategoryPage extends StatefulWidget {
  static final String route = '/category';

  @override
  CategoryPageState createState() => CategoryPageState();
}

class CategoryPageState extends State<CategoryPage> with SingleTickerProviderStateMixin {
  onAddNewCategory(title) {
    final store = StoreProvider.of<AppState>(context);
    final vm = CategoryVM.fromStore(store);

    String categoryId = DateTime.now().millisecondsSinceEpoch.toString();

    final category = new CategoryModel((b) => b
      ..categoryId = categoryId
      ..title = title
    );

    vm.createCategory(category);
  }

  Widget connector({ builder }) {
    return StoreConnector<AppState, CategoryVM>(
      converter: CategoryVM.fromStore,
      builder: builder
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: connector(
        builder: (BuildContext context, CategoryVM vm) {
          final List<CategoryModel> categories = vm.categories;

          return ListView.builder(
            itemCount: categories.length,
            itemBuilder: (BuildContext context, int index) {
              return CategoryItem(categories[index]);
            }
          );
        }
      )
    );
  }

  Widget buildAppBar(context) {
    return AppBar(
      title: Text('Category'),
      titleSpacing: 0,
      elevation: 0,
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.add),
          iconSize: 30,
          tooltip: 'New Category',
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return InputDialog(
                  title: 'New Category',
                  confirmText: Text('ADD'),
                  confirmOnTap: (value) {
                    onAddNewCategory(value);
                    Navigator.of(context).pop();
                  },
                );
              }
            );
          }
        )
      ],
    );
  }
}
