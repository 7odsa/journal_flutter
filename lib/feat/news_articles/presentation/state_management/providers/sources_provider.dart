import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:journal/core/resources/data_state.dart';
import 'package:journal/feat/news_articles/domain/entities/source.dart';
import 'package:journal/feat/news_articles/domain/usecases/get_sources_usecase.dart';
import 'package:journal/feat/news_articles/presentation/di.dart';
import 'package:journal/feat/news_articles/presentation/models/category.dart';
import 'package:journal/feat/news_articles/presentation/state_management/providers/articles_provider.dart';
import 'package:journal/feat/news_articles/presentation/state_management/state.dart';

List<SourceEntity> sources = [];
const List<SourceEntity> initSources = [
  SourceEntity(id: kAllArticlesSourceID, name: "All", category: 'category'),
];
const String kAllArticlesSourceID = 'all';

final sourceProvider =
    NotifierProvider<SourceNotifier, State<List<SourceEntity>, Exception>>(
      SourceNotifier.new,
    );

class SourceNotifier extends Notifier<State<List<SourceEntity>, Exception>> {
  final GetSourcesUsecase getSourcesUsecase = di();
  @override
  State<List<SourceEntity>, Exception> build() {
    return LoadingState();
  }

  Future<void> getAllSourcesByCategory(Category category) async {
    state = LoadingState();
    final data = await getSourcesUsecase.call(params: category);
    if (data is DataSucces) {
      state = SuccessState(data.data);
      ref.read(articlesProvider.notifier).getArticles(category);
    } else if (data is DataFailed) {
      state = ErrorState(data.error);
    }
  }
}

final currentSourceIndexProvider = StateProvider<int>((ref) => 0);
