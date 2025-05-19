import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:journal/core/resources/data_state.dart';
import 'package:journal/feat/news_articles/domain/entities/article.dart';
import 'package:journal/feat/news_articles/domain/entities/source.dart';
import 'package:journal/feat/news_articles/domain/usecases/get_articles_usecase.dart';
import 'package:journal/feat/news_articles/presentation/di.dart';
import 'package:journal/feat/news_articles/presentation/models/category.dart';
import 'package:journal/feat/news_articles/presentation/state_management/providers/sources_provider.dart';
import 'package:journal/feat/news_articles/presentation/state_management/state.dart';

final Provider<State<List<ArticleEntity>, Exception>>
filteredArticlessProvider = Provider((ref) {
  final articlesState = ref.watch(articlesProvider);
  final indexSourcesState = ref.watch(currentSourceIndexProvider);

  // Todo Handle It
  if ((articlesState is LoadingState)) {
    return LoadingState();
  }

  if ((articlesState is ErrorState)) {
    return articlesState;
  } else {
    return SuccessState(
      (sources[indexSourcesState].id == kAllArticlesSourceID)
          ? articlesState.data
          : articlesState.data
              ?.where(
                (element) =>
                    sources[indexSourcesState].name == element.source!.name,
              )
              .toList(),
    );
  }
});

final articlesProvider =
    NotifierProvider<ArticlesNotifier, State<List<ArticleEntity>, Exception>>(
      ArticlesNotifier.new,
    );

class ArticlesNotifier extends Notifier<State<List<ArticleEntity>, Exception>> {
  final GetArticlesUsecase _getArticlesUsecase = di();

  @override
  State<List<ArticleEntity>, DioException> build() {
    return LoadingState();
  }

  void getArticles(Category category) async {
    state = LoadingState();
    sources = [...initSources];

    final DataState<List<ArticleEntity>> dataState = await _getArticlesUsecase(
      params: category,
    );

    if (dataState is DataSucces) {
      for (var article in dataState.data!) {
        sources.add(
          article.source ??
              SourceEntity(id: null, name: 'null', category: 'null'),
        );
      }
      state = SuccessState(dataState.data);
    } else if (dataState is DataFailed) {
      state = ErrorState(dataState.error);
    } else {
      state = LoadingState();
    }
  }
}
