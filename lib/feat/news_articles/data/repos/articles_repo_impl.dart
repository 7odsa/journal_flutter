import 'package:journal/core/resources/data_state.dart';
import 'package:journal/core/utils/network_provider/network_provider.dart';
import 'package:journal/feat/news_articles/data/data_sources/remote/articles_remote_ds.dart';
import 'package:journal/feat/news_articles/data/models/articles.dart';
import 'package:journal/feat/news_articles/domain/repos/articles_repo.dart';
import 'package:journal/feat/news_articles/presentation/models/category.dart';

class ArticlesRepoImpl extends ArticlesRepo {
  // TODO remoteDataSource
  final ArticlesRemoteDs articlesRemoteDs;
  // Todo localeDataSource

  ArticlesRepoImpl({required this.articlesRemoteDs});
  @override
  Future<DataState<List<ArticlesModel>>> getArticles({
    Category? category,
  }) async {
    if (isConnectedNotifier.value) {
      // TODO Cashe the data

      return articlesRemoteDs.getArticles(category: category);
    } else
      // Todo else
      // TODO get Cashed data
      return DataSucces(data: []);
  }
}
