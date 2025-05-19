import 'dart:io';

import 'package:dio/dio.dart';
import 'package:journal/core/constants/constants.dart';
import 'package:journal/core/resources/data_state.dart';
import 'package:journal/feat/news_articles/data/models/articles.dart';
import 'package:journal/feat/news_articles/presentation/models/category.dart';

class ArticlesRemoteDs {
  Dio dio;
  ArticlesRemoteDs({required this.dio});

  Future<DataState<List<ArticlesModel>>> getArticles({
    Category? category,
  }) async {
    Response response = await dio.get(
      'https://newsapi.org/v2/top-headlines?category=${category?.name ?? "general"}&apiKey=$kApiKey&pageSize=100',
    );
    if (response.statusCode == HttpStatus.ok) {
      final data = ArticlesModel.getArticlesFromJson(response.data);

      return DataSucces(data: data);
    } else {
      return DataFailed(
        error: DioException(requestOptions: response.requestOptions),
      );
    }
  }
}
