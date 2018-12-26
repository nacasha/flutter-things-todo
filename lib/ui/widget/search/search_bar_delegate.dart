import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:thingstodo/redux/app/app_state.dart';
import 'package:thingstodo/data/model/models.dart';
import 'package:thingstodo/ui/home/home_page.dart';
import 'package:thingstodo/ui/task/task_item.dart';
import 'package:thingstodo/ui/task/pages/task_detail_page.dart';

import 'search_vm.dart';

class SearchBarDelegate extends SearchDelegate<int> {
  Widget connector({ builder }) {
    return StoreConnector<AppState, SearchVM>(
      converter: SearchVM.fromStore,
      builder: builder
    );
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      tooltip: 'Back',
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final Store<AppState> store = StoreProvider.of<AppState>(context);
    final SearchVM vm = SearchVM.fromStore(store);

    final List<TaskModel> suggestions = query.isEmpty ? []
        : vm.tasks.where((task) => (
            task.title.toLowerCase().contains(query.toLowerCase())
          )).toList();

    return _SuggestionList(
      query: query,
      suggestions: suggestions,
      onSelected: (TaskModel suggestion) {
        close(context, null);
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (ctv) => TaskDetailPage(task: suggestion)
          ),
          (route) => route.isFirst
        );
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final Store<AppState> store = StoreProvider.of<AppState>(context);
    final SearchVM vm = SearchVM.fromStore(store);

    final List<TaskModel> suggestions = query.isEmpty ? []
        : vm.tasks.where((task) => (
            task.title.toLowerCase().contains(query.toLowerCase())
          )).toList();

    return _SuggestionList(
      query: query,
      suggestions: suggestions,
      onSelected: (TaskModel suggestion) {
        query = suggestion.title;
        showResults(context);
      },
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
        tooltip: 'Clear',
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
          showSuggestions(context);
        },
      )
    ];
  }
}

class _SuggestionList extends StatelessWidget {
  const _SuggestionList({this.suggestions, this.query, this.onSelected});

  final List<TaskModel> suggestions;
  final String query;
  final ValueChanged<TaskModel> onSelected;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (BuildContext context, int i) {
        final TaskModel task = suggestions[i];

        return InkWell(
          onTap: () {
            onSelected(task);
          },
          child: IgnorePointer(
            child: TaskItem(task),
          ),
        );
      },
    );
  }
}
