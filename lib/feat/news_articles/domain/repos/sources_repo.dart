import 'package:journal/core/resources/data_state.dart';
import 'package:journal/feat/news_articles/domain/entities/source.dart';
import 'package:journal/feat/news_articles/presentation/models/category.dart';

abstract class SourcesRepo {
  Future<DataState<List<SourceEntity>>> getAllSources(Category category);
}
