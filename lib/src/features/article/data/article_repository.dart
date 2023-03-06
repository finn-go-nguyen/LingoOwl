import '../../../constants/type_defs/type_defs.dart';
import '../model/article.dart';

abstract class ArticleRepository {
  Future<LArticle> fetchArticle(ArticleId id);
}
