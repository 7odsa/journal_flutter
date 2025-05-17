import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:journal/feat/news_articles/data/data_sources/remote/articles_remote_ds.dart';
import 'package:journal/feat/news_articles/data/repos/articles_repo_impl.dart';
import 'package:journal/feat/news_articles/domain/repos/articles_repo.dart';
import 'package:journal/feat/news_articles/domain/usecases/get_articles_usecase.dart';

final di = GetIt.instance;

void initDependancies() {
  di.registerSingleton<Dio>(Dio());
  di.registerSingleton<ArticlesRemoteDs>(ArticlesRemoteDs(dio: di()));
  di.registerSingleton<ArticlesRepo>(ArticlesRepoImpl(articlesRemoteDs: di()));
  di.registerSingleton<GetArticlesUsecase>(GetArticlesUsecase(repo: di()));
}
