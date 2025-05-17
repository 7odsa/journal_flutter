import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:journal/common/theme_state.dart';
import 'package:journal/core/utils/network_provider/network_provider.dart';
import 'package:journal/feat/news_articles/presentation/di.dart';
import 'package:journal/feat/news_articles/presentation/screens/main_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

void main() {
  initDependancies();
  runApp(const MainApp());
}

class MainApp extends ConsumerStatefulWidget {
  const MainApp({super.key});

  @override
  ConsumerState<MainApp> createState() => _MainAppState();
}

class _MainAppState extends ConsumerState<MainApp> {
  Locale locale = Locale('en');

  late StreamSubscription<List<ConnectivityResult>> subscription;

  @override
  void initState() {
    super.initState();
    subscription = Connectivity().onConnectivityChanged.listen((
      List<ConnectivityResult> result,
    ) {
      if (result.contains(ConnectivityResult.none)) {
        // TODO create isConnectedNotifier provider
        isConnectedNotifier.value = false;

        print("no internet");
      } else {
        isConnectedNotifier.value = true;
        // getHttp();
      }
    });
  }

  @override
  void dispose() {
    subscription.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );

    return ProviderScope(
      child: Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          ThemeMode mode = ref.watch(themeProvider);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
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

            theme: ThemeData.from(
              colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.green,
                brightness: Brightness.light,
              ),
            ),
            darkTheme: ThemeData.dark(),
            themeMode: mode,
            home: MainScreen(
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
