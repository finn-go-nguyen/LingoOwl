import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain_manager.dart';
import '../data/search_repository.dart';
import 'search_view_state.dart';

final searchViewControllerProvider =
    StateNotifierProvider<SearchViewController, AsyncValue<SearchViewState>>(
        (ref) {
  final searchRepository =
      ref.watch(DomainManager.instance.searchRepositoryProvider);
  return SearchViewController(searchRepository);
});

class SearchViewController extends StateNotifier<AsyncValue<SearchViewState>> {
  SearchViewController(this._searchRepository)
      : super(const AsyncData(SearchViewState()));

  final SearchRepository _searchRepository;

  void onQueryChanged(String query) async {
    state.whenData((value) async {
      query = query.trim();
      if (query.isEmpty || query == value.oldQuery) return;

      state = const AsyncLoading();
      _searchRepository.searchCourse(query);
      state = AsyncData(SearchViewState(
        oldQuery: query,
      ));
    });
  }

  @override
  void dispose() {
    _searchRepository.dispose();
    super.dispose();
  }
}
