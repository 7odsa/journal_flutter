import 'package:journal/feat/news_articles/domain/entities/source.dart';

class SourceModel extends SourceEntity {
  SourceModel({
    required super.id,
    required super.name,
    required super.category,
  });

  factory SourceModel.fromJson(Map<String, dynamic> json) {
    return SourceModel(
      id: json['source']['id'],
      name: json['source']['name'],
      category: json['source']['category'],
    );
  }
}
