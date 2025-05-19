class Category {
  final String name;
  final String imgPath;

  Category({required this.name, required this.imgPath});

  static final List<Category> categories = [
    Category(name: 'general', imgPath: 'assets/general.png'),
    Category(name: 'business', imgPath: 'assets/business.png'),
    Category(name: 'entertainment', imgPath: 'assets/entertainment.png'),
    Category(name: 'health', imgPath: 'assets/health.png'),
    Category(name: 'science', imgPath: 'assets/science.png'),
    Category(name: 'sports', imgPath: 'assets/sports.png'),
    Category(name: 'technology', imgPath: 'assets/technology.png'),
  ];
}
