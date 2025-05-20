import 'package:journal/feat/news_articles/domain/entities/source.dart';

class ArticleEntity {
  final String? id;
  final String? author;
  final String? title;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;

  final String? description;
  final SourceEntity? source;

  const ArticleEntity({
    required this.id,
    required this.author,
    required this.title,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.description,
    required this.source,
  });
}
