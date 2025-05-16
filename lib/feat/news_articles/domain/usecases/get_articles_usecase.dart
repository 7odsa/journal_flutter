import 'package:journal/core/resources/data_state.dart';
import 'package:journal/core/resources/usecase.dart';
import 'package:journal/feat/news_articles/domain/entities/article.dart';
import 'package:journal/feat/news_articles/domain/repos/articles_repo.dart';
import 'package:journal/feat/news_articles/presentation/models/category.dart';

class GetArticlesUsecase
    extends Usecase<DataState<List<ArticleEntity>>, Category> {
  final ArticlesRepo repo;

  GetArticlesUsecase({required this.repo});

  @override
  Future<DataState<List<ArticleEntity>>> call({Category? params}) {
    return repo.getArticles(category: params);
  }
}
