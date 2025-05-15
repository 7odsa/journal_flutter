import 'package:journal/core/resources/data_state.dart';
import 'package:journal/core/resources/usecase.dart';
import 'package:journal/feat/news_articles/domain/entities/article.dart';
import 'package:journal/feat/news_articles/domain/repos/articles_repo.dart';

class GetArticlesUsecase extends Usecase<DataState<ArticleEntity>, void> {
  final ArticlesRepo repo;

  GetArticlesUsecase({required this.repo});

  @override
  Future<DataState<ArticleEntity>> call({void params}) {
    return repo.getArticles();
  }
}
