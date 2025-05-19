import 'package:journal/feat/news_articles/domain/entities/source.dart';

class SourceModel extends SourceEntity {
  SourceModel({
    required super.id,
    required super.name,
    required super.category,
  });

  factory SourceModel.fromJson(Map<String, dynamic> json) {
    return SourceModel(
      id: json['id'],
      name: json['name'],
      category: json['category'],
    );
  }
  static List<SourceModel> allSourcesfromJson(Map<String, dynamic> json) {
    return (json['sources'] as List<dynamic>).map((e) {
      return SourceModel.fromJson(e);
    }).toList();
  }

  Map<String, dynamic> toJson(SourceModel source) {
    return {'id': source.id, 'name': source.name, 'category': source.category};
  }
}
