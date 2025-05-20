import 'package:flutter/material.dart';
import 'package:journal/feat/news_articles/domain/entities/article.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleItem extends StatelessWidget {
  const ArticleItem({super.key, required this.article});
  final ArticleEntity article;
  String get date =>
      (DateTime.now())
          .difference(DateTime.parse(article.publishedAt.toString()))
          .inMinutes
          .toString();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _launchUrl,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white),
        ),
        padding: EdgeInsets.all(6),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 150,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(article.urlToImage!, fit: BoxFit.cover),
              ),
            ),
            Text(article.title!),
            Row(
              children: [
                Text("By : ${article.author}"),
                Spacer(),
                Text('$date minutes ago'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl() async {
    if (await canLaunchUrl(Uri.parse(article.url!))) {
      await launchUrl(Uri.parse(article.url!), mode: LaunchMode.inAppWebView);
    }
  }
}
