import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wabiz_client/router.dart';
import 'package:wabiz_client/theme.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'wabiz',
      theme: wabizDefaultTheme,
      routerConfig: router,
      themeAnimationStyle: AnimationStyle(
        curve: Curves.easeInCirc,
        duration: const Duration(milliseconds: 350),
      ),
    );
  }
}
