import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:journal/core/resources/data_state.dart';
import 'package:journal/feat/news_articles/domain/entities/article.dart';
import 'package:journal/feat/news_articles/domain/usecases/get_articles_usecase.dart';
import 'package:journal/feat/news_articles/presentation/di.dart';
import 'package:journal/feat/news_articles/presentation/models/category.dart';
import 'package:journal/feat/news_articles/presentation/state_management/state.dart';

final articlesProvider = NotifierProvider<
  ArticlesNotifier,
  State<List<ArticleEntity>, DioException>
>(ArticlesNotifier.new);

class ArticlesNotifier
    extends Notifier<State<List<ArticleEntity>, DioException>> {
  final GetArticlesUsecase _getArticlesUsecase = di();

  @override
  State<List<ArticleEntity>, DioException> build() {
    return LoadingState();
  }

  void getArticles(Category category) async {
    state = LoadingState();

    final DataState<List<ArticleEntity>> dataState = await _getArticlesUsecase(
      params: category,
    );

    if (dataState is DataSucces) {
      state = SuccessState(dataState.data);
    } else if (dataState is DataFailed) {
      state = ErrorState(dataState.error);
    } else {
      state = LoadingState();
    }
  }
}
