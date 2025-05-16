import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:journal/common/theme_state.dart';
import 'package:journal/feat/news_articles/presentation/screens/home_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  Locale locale = Locale('en');

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          ThemeMode mode = ref.watch(themeProvider);
          return MaterialApp(
            title: 'Localizations Sample App',
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: [
              Locale('en'), // English
              Locale('ar'), // arabic
            ],
            locale: locale,

            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            themeMode: mode,
            home: HomeScreen(
              changeLocale: (String lang) {
                setState(() {
                  locale = Locale(lang);
                });
              },
            ),
          );
        },
      ),
    );
  }
}
