import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:journal/common/theme_state.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:journal/feat/news_articles/presentation/screens/categories_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key, required this.changeLocale});
  final void Function(String lang) changeLocale;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool isEn = true;
  late Widget currentScreen;
  Category? category;
  void onChangeScreen(Widget screen, {Category? c}) {
    setState(() {
      category = c;
      currentScreen = screen;
    });
  }

  @override
  void initState() {
    currentScreen = CategoriesScreen(onChangeScreen: onChangeScreen);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer(context),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              // TODO
              // !push search screen
            },
            icon: Icon(Icons.search_rounded, size: 40),
          ),
          SizedBox(width: 8),
        ],
      ),
      body: Padding(padding: const EdgeInsets.all(8.0), child: currentScreen),
    );
  }

  Drawer drawer(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.black,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.white),
              child: Center(
                child: Text(
                  AppLocalizations.of(context)!.theJournal,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            TextButton.icon(
              onPressed: () {
                onChangeScreen(
                  CategoriesScreen(onChangeScreen: onChangeScreen),
                );
                Navigator.pop(context);
              },
              label: Text(
                AppLocalizations.of(context)!.home,
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
              icon: Icon(Icons.home_rounded, size: 32, color: Colors.white),
            ),
            Divider(endIndent: 16, indent: 16),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 16,
              ),
              child: Row(
                children: [
                  Icon(Icons.draw_rounded, color: Colors.white, size: 32),
                  SizedBox(width: 8),
                  Text(
                    AppLocalizations.of(context)!.theme,
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  Spacer(),
                  Consumer(
                    builder: (
                      BuildContext context,
                      WidgetRef ref,
                      Widget? child,
                    ) {
                      bool isLight = ref.read(themeProvider) == ThemeMode.light;
                      return Switch(
                        activeColor: Colors.white,
                        value: isLight,
                        onChanged: (value) {
                          isLight = !isLight;
                          ref.read(themeProvider.notifier).toggleTheme();
                        },
                      );
                    },
                  ),
                ],
              ),
            ),

            Divider(endIndent: 16, indent: 16),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 16,
              ),
              child: Row(
                children: [
                  Icon(Icons.language_rounded, color: Colors.white, size: 32),
                  SizedBox(width: 8),
                  Text(
                    AppLocalizations.of(context)!.language,
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  Spacer(),
                  Builder(
                    builder: (BuildContext context) {
                      return Switch(
                        activeColor: Colors.white,
                        value: isEn,
                        onChanged: (value) {
                          print(value);
                          isEn = value;
                          widget.changeLocale(isEn ? "en" : 'ar');
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
