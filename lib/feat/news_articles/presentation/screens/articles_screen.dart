import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:journal/feat/news_articles/presentation/models/category.dart';
import 'package:journal/feat/news_articles/presentation/state_management/providers/articles_provider.dart';
import 'package:journal/feat/news_articles/presentation/state_management/state.dart';

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
    Future.microtask(() {
      ref.read(articlesProvider.notifier).getArticles(widget.category);
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(articlesProvider);
    final Widget screen =
        (state is LoadingState)
            ? Center(child: CircularProgressIndicator())
            : Center(
              child: Text(
                (state is SuccessState)
                    ? state.data!.map((e) => e.auther).toList().toString()
                    : state.error!.message ?? "SomeThing Went Wrong",
              ),
            );
    return screen;
  }
}
