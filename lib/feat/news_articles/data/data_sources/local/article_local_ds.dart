import 'dart:async';

import 'package:journal/core/resources/data_state.dart';
import 'package:journal/feat/news_articles/data/models/articles.dart';
import 'package:journal/feat/news_articles/presentation/models/category.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class ArticleLocalDs {
  ArticleLocalDs._init();

  static final String kArticleTableName = "articles";

  static final ArticleLocalDs instance = ArticleLocalDs._init();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initializaDB(kArticleTableName);
    return _database!;
  }

  FutureOr<void> _createDB(Database db, int version) async {
    await db.execute('''CREATE TABLE $kArticleTableName (
      id  TEXT PRIMARY KEY,
      author  TEXT,
      title  TEXT,
      url  TEXT,
      urlToImage  TEXT,
      publishedAt  TEXT,
      sourceId  TEXT,
      sourceName  TEXT,
      category  TEXT,
      description  TEXT
    )''');
  }

  Future<Database> _initializaDB(String kArticleTableName) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, kArticleTableName);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future<void> createArticle(ArticlesModel article, Category category) async {
    final db = await instance.database;
    await db.insert(kArticleTableName, {
      ...article.toJson(),
      'category': category.name,
    });
  }

  Future<void> addListOfArticles(
    List<ArticlesModel> articles,
    Category category,
  ) async {
    for (final article in articles) {
      await createArticle(article, category);
    }
  }

  Future<DataState<List<ArticlesModel>>> readAllArticles(
    Category category,
  ) async {
    try {
      final db = await instance.database;
      print(category.name);
      final res = await db.query(
        kArticleTableName,
        where: ' category = "${category.name}"',
      );

      return DataSucces(
        data:
            res.map((map) {
              print(map['category']);
              return ArticlesModel.fromJson(map, isLocale: true);
            }).toList(),
      );
    } on Exception catch (e) {
      return DataFailed(error: e);
    }
  }

  Future<void> deleteAllArticles() async {
    final db = await instance.database;
    db.rawDelete("Delete From $kArticleTableName");
  }

  Future<void> close() async {
    final db = await instance.database;
    db.close();
  }
}
