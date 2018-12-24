import 'package:redux/redux.dart';

import 'package:thingstodo/data/model/models.dart';

import 'category_actions.dart';
import 'category_state.dart';

final categoryReducers = combineReducers<CategoryState>([
  TypedReducer<CategoryState, CategoryInitialStateAction>(categoryInitialStateAction),
  TypedReducer<CategoryState, CreateCategoryAction>(createCategoryAction),
  TypedReducer<CategoryState, UpdateCategoryAction>(updateCategoryAction),
  TypedReducer<CategoryState, RemoveCategoryAction>(removeCategoryAction)
]);

CategoryState categoryInitialStateAction(CategoryState state, CategoryInitialStateAction action) {
  if (state.categories.length == 0) {
    return state.rebuild((b) => b
      ..categories.add(CategoryModel((b) => b
        ..categoryId = '0'
        ..title = 'Uncategorized'
      ))
    );
  }
  return state;
}

CategoryState createCategoryAction(CategoryState state, CreateCategoryAction action) {
  return state.rebuild((b) => b
    ..categories.add(action.category)
  );
}

CategoryState updateCategoryAction(CategoryState state, UpdateCategoryAction action) {
  int categoryIndex = state.categories.indexOf(action.category);

  return state.rebuild((state) =>
    state.categories.replaceRange(categoryIndex, categoryIndex + 1, [action.updates])
  );
}

CategoryState removeCategoryAction(CategoryState state, RemoveCategoryAction action) {
  return state.rebuild((b) => b
    ..categories.removeWhere((CategoryModel category) {
      return category.categoryId == action.category.categoryId;
    })
  );
}
