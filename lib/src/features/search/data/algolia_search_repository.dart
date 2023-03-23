import 'package:algolia_helper_flutter/algolia_helper_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain_manager.dart';
import 'hits_page.dart';
import 'search_repository.dart';

final searchDataProvider = StreamProvider<HitsPage>((ref) {
  final searchRepository =
      ref.watch(DomainManager.instance.searchRepositoryProvider);
  return searchRepository.searchData;
});

class AlgoliaSearchRepository implements SearchRepository {
  static final _courseSearcher = HitsSearcher(
    applicationID: '41I3Q8808J',
    apiKey: '5102b57f1e873733419d32e3def65526',
    indexName: 'dev_courses',
  )..applyState(
      (state) => state.copyWith(
        hitsPerPage: 10,
        query: '',
        page: 0,
      ),
    );

  @override
  Stream<HitsPage> get searchData =>
      _courseSearcher.responses.map(HitsPage.fromResponse);

  @override
  void searchCourse(String query) {
    if (query.length <= 2) return;
    _courseSearcher.query(query);
    _courseSearcher.applyState(
      (state) => state.copyWith(
        page: 0,
      ),
    );
  }

  @override
  void fetchNextPage() {
    _courseSearcher.applyState(
      (state) => state.copyWith(
        page: state.page != null ? state.page! + 1 : null,
      ),
    );
  }

  @override
  void resetPageKey() {
    _courseSearcher.applyState(
      (state) => state.copyWith(page: 0),
    );
  }

  @override
  void dispose() {
    _courseSearcher.applyState(
      (state) => const SearchState(indexName: 'dev_courses'),
    );
  }
}
