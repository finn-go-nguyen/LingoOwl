import 'hits_page.dart';

abstract class SearchRepository {
  Stream<HitsPage> get searchData;
  void searchCourse(String query);
  void fetchNextPage();
  void resetPageKey();
  void dispose();
}
