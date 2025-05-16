import 'package:journal/feat/news_articles/domain/entities/source.dart';

class ArticleEntity {
  final String? id;
  final String? auther;
  final String? title;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
  final SourceEntity? source;

  const ArticleEntity({
    required this.id,
    required this.auther,
    required this.title,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.source,
  });
}
