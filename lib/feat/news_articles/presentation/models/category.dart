class Category {
  final String name;
  final String imgPath;

  Category({required this.name, required this.imgPath});

  static final List<Category> categories = [
    Category(name: 'general', imgPath: 'assets/general.png'),
    Category(name: 'Business', imgPath: 'assets/business.png'),
    Category(name: 'Entertainment', imgPath: 'assets/entertainment.png'),
    Category(name: 'General', imgPath: 'assets/general.png'),
    Category(name: 'Health', imgPath: 'assets/health.png'),
    Category(name: 'Science', imgPath: 'assets/science.png'),
    Category(name: 'Sports', imgPath: 'assets/sports.png'),
    Category(name: 'Technology', imgPath: 'assets/technology.png'),
  ];
}
