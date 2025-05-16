import 'package:dio/dio.dart';
import 'package:journal/core/constants/constants.dart';
import 'package:journal/feat/news_articles/data/models/articles.dart';
import 'package:journal/feat/news_articles/presentation/models/category.dart';

class ArticlesRemoteDs {
  Dio dio = Dio();

  Future<List<ArticlesModel>> getArticles({Category? category}) async {
    // Todo setCategory and remmove country
    Response response = await dio.get(
      'https://newsapi.org/v2/top-headlines?category=${category?.name ?? "general"}&apiKey=$kApiKey&pageSize=100',
    );

    // if(response.statusCode == )
    return ArticlesModel.getArticlesFromJson(response.data);
  }
}
