import 'package:journal/core/resources/data_state.dart';
import 'package:journal/feat/news_articles/domain/entities/article.dart';
import 'package:journal/feat/news_articles/presentation/models/category.dart';

abstract class ArticlesRepo {
  Future<DataState<List<ArticleEntity>>> getArticles({Category? category});
}
