import 'dart:io';

import 'package:dio/dio.dart';
import 'package:journal/core/constants/constants.dart';
import 'package:journal/core/resources/data_state.dart';
import 'package:journal/feat/news_articles/data/models/source.dart';
import 'package:journal/feat/news_articles/presentation/models/category.dart';

class SourceRemoteDs {
  final Dio dio;

  SourceRemoteDs({required this.dio});

  Future<DataState<List<SourceModel>>> getAllSources(Category category) async {
    try {
      final response = await dio.get(
        "https://newsapi.org/v2/top-headlines/sources?category=${category.name}&apiKey=$kApiKey",
      );
      if (response.statusCode == HttpStatus.ok) {
        return DataSucces(data: SourceModel.allSourcesfromJson(response.data));
      } else
        return DataFailed(
          error: DioException(requestOptions: response.requestOptions),
        );
    } on Exception catch (e) {
      return DataFailed(error: e);
    }
  }
}
