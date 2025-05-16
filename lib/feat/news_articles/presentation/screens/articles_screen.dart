import 'package:flutter/material.dart';
import 'package:journal/feat/news_articles/data/repos/articles_repo_impl.dart';
import 'package:journal/feat/news_articles/domain/usecases/get_articles_usecase.dart';
import 'package:journal/feat/news_articles/presentation/models/category.dart';

class ArticlesScreen extends StatelessWidget {
  const ArticlesScreen({super.key, required this.category});
  final Category category;
  void test() async {
    final data = await GetArticlesUsecase(repo: ArticlesRepoImpl()).call();
    print("main.dart");
    print(data.data!.map((e) => e.auther).toList());
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: GetArticlesUsecase(
        repo: ArticlesRepoImpl(),
      ).call(params: category),
      builder:
          (context, snapshot) =>
              snapshot.connectionState == ConnectionState.waiting
                  ? Center(child: CircularProgressIndicator())
                  : Center(
                    child: Text(
                      snapshot.data!.data!
                          .map((e) => e.auther)
                          .toList()
                          .toString(),
                    ),
                  ),
    );
  }
}
