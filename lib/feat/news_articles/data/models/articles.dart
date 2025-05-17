import 'package:journal/feat/news_articles/data/models/source.dart';
import 'package:journal/feat/news_articles/domain/entities/article.dart';

class ArticlesModel extends ArticleEntity {
  ArticlesModel({
    required super.id,
    required super.auther,
    required super.title,
    required super.url,
    required super.urlToImage,
    required super.publishedAt,
    required super.source,
  });

  factory ArticlesModel.fromJson(Map<String, dynamic> json) {
    return ArticlesModel(
      id: null,
      auther: json['author'],
      title: json['title'],
      url: json['url'],
      urlToImage: json['urlToImage'],
      publishedAt: json['publishedAt'],
      source: SourceModel.fromJson(json),
    );
  }

  static List<ArticlesModel> getArticlesFromJson(Map<String, dynamic> json) {
    return (json["articles"] as List<dynamic>)
        .map((e) => ArticlesModel.fromJson(e))
        .toList();
  }
}
