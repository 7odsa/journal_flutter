import 'package:journal/core/resources/data_state.dart';
import 'package:journal/core/utils/network_provider/network_provider.dart';
import 'package:journal/feat/news_articles/data/data_sources/local/article_local_ds.dart';
import 'package:journal/feat/news_articles/data/data_sources/remote/articles_remote_ds.dart';
import 'package:journal/feat/news_articles/data/models/articles.dart';
import 'package:journal/feat/news_articles/domain/repos/articles_repo.dart';
import 'package:journal/feat/news_articles/presentation/models/category.dart';

class ArticlesRepoImpl extends ArticlesRepo {
  final ArticlesRemoteDs articlesRemoteDs;
  final ArticleLocalDs articleLocalDs;
  ArticlesRepoImpl({
    required this.articlesRemoteDs,
    required this.articleLocalDs,
  });
  @override
  Future<DataState<List<ArticlesModel>>> getArticles({
    Category? category,
  }) async {
    DataState<List<ArticlesModel>> dataState;
    if (isConnectedNotifier.value) {
      dataState = await articlesRemoteDs.getArticles(category: category);
      final data = dataState.data;

      if (data != null) {
        articleLocalDs.deleteAllArticles();
        articleLocalDs.addListOfArticles(
          data,
          category ?? Category.categories[0],
        );
      }
    } else {
      dataState = await articleLocalDs.readAllArticles(
        category ?? Category.categories[0],
      );
    }

    return dataState;
  }
}
