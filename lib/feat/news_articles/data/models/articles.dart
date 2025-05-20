import 'package:journal/feat/news_articles/data/models/source.dart';
import 'package:journal/feat/news_articles/domain/entities/article.dart';

class ArticlesModel extends ArticleEntity {
  ArticlesModel({
    required super.id,
    required super.author,
    required super.title,
    required super.url,
    required super.urlToImage,
    required super.publishedAt,
    required super.description,
    required super.source,
  });

  factory ArticlesModel.fromJson(
    Map<String, dynamic> json, {
    bool isLocale = false,
  }) {
    return ArticlesModel(
      id: null,
      author: json['author'],
      title: json['title'],
      url: json['url'],
      urlToImage: json['urlToImage'],
      publishedAt: json['publishedAt'],
      description: json['description'],
      source:
          (isLocale)
              ? SourceModel(
                id: json['sourceId'],
                name: json['sourceName'],
                category: null,
              )
              : SourceModel.fromJson(json['source']),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'author': this.author,
      'title': this.title,
      'url': this.url,
      'urlToImage': this.urlToImage,
      'publishedAt': this.publishedAt,
      'sourceId': this.source?.id,
      'sourceName': this.source?.name,
      'description': this.description,
    };
  }

  static List<ArticlesModel> getArticlesFromJson(Map<String, dynamic> json) {
    return (json["articles"] as List<dynamic>)
        .map((e) => ArticlesModel.fromJson(e))
        .toList();
  }
}
