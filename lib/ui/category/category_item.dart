import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:thingstodo/theme/colors.dart';
import 'package:thingstodo/data/model/models.dart';
import 'package:thingstodo/redux/app/app_state.dart';
import 'package:thingstodo/ui/widget/dialog/confirm_dialog.dart';
import 'package:thingstodo/ui/widget/dialog/input_dialog.dart';

import 'category_vm.dart';

class CategoryItem extends StatelessWidget {
  CategoryItem(this.category);

  final CategoryModel category;

  onCategoryPressed() {
    print('pressed');
  }

  onEditPressed(context, CategoryVM vm) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return InputDialog(
          title: 'New Category',
          initialText: category.title,
          confirmText: Text('ADD'),
          confirmOnTap: (value) {
            vm.updateCategory(category, category.rebuild((b) => b
              ..title = value
            ));

            Navigator.of(context).pop();
          },
        );
      }
    );
  }

  onTrashPressed(context, CategoryVM vm) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ConfirmDialog(
          title: 'Confirm',
          content: 'Delete this category ?',
          confirmText: Text('DELETE'),
          confirmOnTap: () {
            vm.removeCategory(category);
            Navigator.of(context).pop();
          },
        );
      }
    );
  }

  Widget connector({ builder }) {
    return StoreConnector<AppState, CategoryVM>(
      converter: CategoryVM.fromStore,
      builder: builder
    );
  }

  Widget build(BuildContext context) {


    return connector(
      builder: (BuildContext context, CategoryVM vm) {
        return InkWell(
          onTap: onCategoryPressed,
          child: Container(
            decoration: BoxDecoration(border: Border(
              bottom: BorderSide(color: Colors.grey.shade300)
            )),
            child: buildListTile(context, vm)
          ),
        );
      }
    );
  }

  Widget buildListTile(context, vm) {
    // List Tile
    return ListTile(
      contentPadding: EdgeInsets.only(left: 17, right: 7),
      title: Text(category.title),
      trailing: category.categoryId == '0' ? null : Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          IconButton(
            onPressed: () { onEditPressed(context, vm); },
            icon: Icon(
              FontAwesomeIcons.edit,
              size: 20
            ),
          ),
          IconButton(
            onPressed: () { onTrashPressed(context, vm); },
            icon: Icon(
              FontAwesomeIcons.trash,
              size: 20
            ),
          ),
        ],
      )
    );
  }
}
