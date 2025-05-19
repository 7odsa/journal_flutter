import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:journal/feat/news_articles/data/data_sources/local/article_local_ds.dart';
import 'package:journal/feat/news_articles/data/data_sources/local/source_local_ds.dart';
import 'package:journal/feat/news_articles/data/data_sources/remote/articles_remote_ds.dart';
import 'package:journal/feat/news_articles/data/data_sources/remote/source_remote_ds.dart';
import 'package:journal/feat/news_articles/data/repos/articles_repo_impl.dart';
import 'package:journal/feat/news_articles/data/repos/source_repo_impl.dart';
import 'package:journal/feat/news_articles/domain/repos/articles_repo.dart';
import 'package:journal/feat/news_articles/domain/repos/sources_repo.dart';
import 'package:journal/feat/news_articles/domain/usecases/get_articles_usecase.dart';
import 'package:journal/feat/news_articles/domain/usecases/get_sources_usecase.dart';

final di = GetIt.instance;

void initDependancies() {
  di.registerSingleton<Dio>(Dio());

  di.registerSingleton<ArticlesRemoteDs>(ArticlesRemoteDs(dio: di()));
  di.registerSingleton<ArticleLocalDs>(ArticleLocalDs.instance);
  di.registerSingleton<ArticlesRepo>(
    ArticlesRepoImpl(articlesRemoteDs: di(), articleLocalDs: di()),
  );
  di.registerSingleton<GetArticlesUsecase>(GetArticlesUsecase(repo: di()));

  di.registerSingleton<SourceRemoteDs>(SourceRemoteDs(dio: di()));
  // di.registerSingleton<SourceLocalDs>(SourceLocalDs.instance);
  di.registerSingleton<SourcesRepo>(
    SourceRepoImpl(
      sourceRemoteDs: di(),
      //  sourceLocalDs: di()
    ),
  );
  di.registerSingleton<GetSourcesUsecase>(GetSourcesUsecase(sourcesRepo: di()));
}
