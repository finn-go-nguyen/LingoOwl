import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../course/model/course.dart';
import 'search_view_state.dart';

final searchViewControllerProvider =
    StateNotifierProvider<SearchViewController, AsyncValue<SearchViewState>>(
        (ref) {
  return SearchViewController();
});

class SearchViewController extends StateNotifier<AsyncValue<SearchViewState>> {
  SearchViewController() : super(const AsyncData(SearchViewState()));

  void onQueryChanged(String query) async {
    state.whenData((value) async {
      query = query.trim();
      if (query.isEmpty || query == value.oldQuery) return;

      state = const AsyncLoading();
      await Future.delayed(const Duration(seconds: 1));
      state = AsyncData(SearchViewState(
        courses: <LCourse>[],
        oldQuery: query,
      ));
    });
  }
}
