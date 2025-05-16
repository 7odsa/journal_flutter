import 'package:journal/core/resources/data_state.dart';
import 'package:journal/feat/news_articles/data/data_sources/remote/articles_remote_ds.dart';
import 'package:journal/feat/news_articles/data/models/articles.dart';
import 'package:journal/feat/news_articles/domain/repos/articles_repo.dart';
import 'package:journal/feat/news_articles/presentation/models/category.dart';

class ArticlesRepoImpl extends ArticlesRepo {
  // TODO remoteDataSource
  ArticlesRemoteDs articlesRemoteDs = ArticlesRemoteDs();
  // Todo localeDataSource

  @override
  Future<DataState<List<ArticlesModel>>> getArticles({
    Category? category,
  }) async {
    final data = await articlesRemoteDs.getArticles(category: category);
    return DataSucces(data: data);
  }
}
