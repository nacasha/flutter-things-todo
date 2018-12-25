import 'package:redux/redux.dart';
import 'package:flutter/material.dart';

import 'package:thingstodo/data/model/models.dart';
import 'package:thingstodo/redux/app/app_state.dart';
import 'package:thingstodo/redux/category/category_actions.dart';

class CategoryVM {
  final List<CategoryModel> categories;

  final Function createCategory;
  final Function removeCategory;
  final Function updateCategory;

  CategoryVM({
    @required this.categories,
    @required this.createCategory,
    @required this.removeCategory,
    @required this.updateCategory,
  });

  static CategoryVM fromStore(Store<AppState> store) {
    final state = store.state;
    final dispatch = store.dispatch;

    return CategoryVM(
      categories: state.category.categories.toList(),
      createCategory: (CategoryModel category) {
        dispatch(CreateCategoryAction(category: category));
      },
      removeCategory: (CategoryModel category) {
        dispatch(RemoveCategoryAction(category: category));
      },
      updateCategory: (CategoryModel category, CategoryModel updates) {
        dispatch(UpdateCategoryAction(category: category, updates: updates));
      },
    );
  }
}
