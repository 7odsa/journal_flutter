class Category {
  final String name;
  final String imgPath;

  Category({required this.name, required this.imgPath});

  static final List<Category> categories = [
    Category(name: 'Business', imgPath: 'assets/images/business.png'),
    Category(name: 'Entertainment', imgPath: 'assets/images/entertainment.png'),
    Category(name: 'General', imgPath: 'assets/images/general.png'),
    Category(name: 'Health', imgPath: 'assets/images/health.png'),
    Category(name: 'Science', imgPath: 'assets/images/science.png'),
    Category(name: 'Sports', imgPath: 'assets/images/sports.png'),
    Category(name: 'Technology', imgPath: 'assets/images/technology.png'),
  ];
}
