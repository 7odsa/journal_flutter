import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:journal/feat/news_articles/domain/entities/source.dart';
import 'package:journal/feat/news_articles/presentation/models/category.dart';
import 'package:journal/feat/news_articles/presentation/state_management/providers/articles_provider.dart';
import 'package:journal/feat/news_articles/presentation/state_management/providers/sources_provider.dart';
import 'package:journal/feat/news_articles/presentation/state_management/state.dart'
    as state;

class ArticlesScreen extends ConsumerStatefulWidget {
  const ArticlesScreen({super.key, required this.category});
  final Category category;

  @override
  ConsumerState<ArticlesScreen> createState() => _ArticlesScreenState();
}

class _ArticlesScreenState extends ConsumerState<ArticlesScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      ref.read(articlesProvider.notifier).getArticles(widget.category);
      ref
          .read(sourceProvider.notifier)
          .getAllSourcesByCategory(widget.category);
      ref.read(currentSourceIndexProvider.notifier).state = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final filteredArticlesState = ref.watch(filteredArticlessProvider);
    final sourcesState = ref.watch(sourceProvider);

    final Widget articlesWidget =
        (filteredArticlesState is state.LoadingState)
            ? Center(child: CircularProgressIndicator())
            : Center(
              child: Text(
                (filteredArticlesState is state.SuccessState)
                    ? filteredArticlesState.data!
                        .map((e) => e.author)
                        .toList()
                        .toString()
                    : filteredArticlesState.error.toString() ??
                        "SomeThing Went Wrong",
              ),
            );

    return Column(children: [sourcesList(sourcesState), articlesWidget]);
  }

  SizedBox sourcesList(
    state.State<List<SourceEntity>, Exception> sourcesState,
  ) {
    final Widget child =
        sourcesState is state.LoadingState
            ? Center(child: CircularProgressIndicator())
            : sourcesState is state.ErrorState
            ? Text(sourcesState.error.toString())
            : ListView.separated(
              separatorBuilder: (context, index) {
                return SizedBox(width: 8);
              },
              scrollDirection: Axis.horizontal,
              itemCount: sourcesState.data!.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    ref.read(currentSourceIndexProvider.notifier).state = index;
                  },
                  child: Text(sourcesState.data![index].name.toString()),
                );
              },
            );
    return SizedBox(height: 50, child: child);
  }
}
