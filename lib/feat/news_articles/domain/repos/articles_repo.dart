import 'package:journal/core/resources/data_state.dart';
import 'package:journal/feat/news_articles/domain/entities/article.dart';

abstract class ArticlesRepo {
  Future<DataState<ArticleEntity>> getArticles();
}
