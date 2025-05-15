import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:journal/common/theme_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer(),
      appBar: AppBar(),
      body: TextButton(onPressed: () {}, child: Text("Switch")),
    );
  }

  Drawer drawer() {
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
                  "The_Journal",
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
                // TODO
              },
              label: Text(
                "Go To Home",
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
                    "Theme",
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
                    "Language",
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ],
              ),
            ),
            Text("TODO", style: TextStyle(color: Colors.red, fontSize: 24)),
          ],
        ),
      ),
    );
  }
}
