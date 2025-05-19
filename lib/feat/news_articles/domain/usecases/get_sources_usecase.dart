import 'package:journal/core/resources/data_state.dart';
import 'package:journal/core/resources/usecase.dart';
import 'package:journal/feat/news_articles/domain/entities/source.dart';
import 'package:journal/feat/news_articles/domain/repos/sources_repo.dart';
import 'package:journal/feat/news_articles/presentation/models/category.dart';

class GetSourcesUsecase
    extends Usecase<DataState<List<SourceEntity>>, Category> {
  final SourcesRepo sourcesRepo;

  GetSourcesUsecase({required this.sourcesRepo});

  @override
  Future<DataState<List<SourceEntity>>> call({Category? params}) async {
    return sourcesRepo.getAllSources(params!);
  }
}
