import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:journal/feat/news_articles/presentation/models/category.dart';
import 'package:journal/feat/news_articles/presentation/screens/articles_screen.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key, required this.onChangeScreen});
  final void Function(Widget screen) onChangeScreen;

  String categoryName(BuildContext ctx) =>
      AppLocalizations.of(ctx)!.goodMorning;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.goodMorning,
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          Text(
            AppLocalizations.of(context)!.hereIsSomeNewsForYou,
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          ...Category.categories.map((e) {
            return categoryItem(e);
          }),
        ],
      ),
    );
  }

  Widget categoryItem(Category e) => GestureDetector(
    onTap: () {
      onChangeScreen(ArticlesScreen(category: e));
    },
    child: Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      width: double.infinity,
      height: 200,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.asset(e.imgPath, fit: BoxFit.cover),
      ),
    ),
  );
}
