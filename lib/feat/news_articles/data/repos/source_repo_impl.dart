import 'package:journal/core/resources/data_state.dart';
import 'package:journal/core/utils/network_provider/network_provider.dart';
import 'package:journal/feat/news_articles/data/data_sources/local/source_local_ds.dart';
import 'package:journal/feat/news_articles/data/data_sources/remote/source_remote_ds.dart';
import 'package:journal/feat/news_articles/domain/entities/source.dart';
import 'package:journal/feat/news_articles/domain/repos/sources_repo.dart';
import 'package:journal/feat/news_articles/presentation/models/category.dart';

class SourceRepoImpl extends SourcesRepo {
  final SourceRemoteDs sourceRemoteDs;
  // final SourceLocalDs sourceLocalDs;

  SourceRepoImpl({
    required this.sourceRemoteDs,
    //  required this.sourceLocalDs
  });

  @override
  Future<DataState<List<SourceEntity>>> getAllSources(Category category) async {
    // if (isConnectedNotifier.value) {
    final data = await sourceRemoteDs.getAllSources(category);
    // ! Cache the Data
    return data;
    //   } else {
    //     return  sourceLocalDs.getAllSources(category);
    //   }
  }
}
