import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wabiz_client/router.dart';
import 'package:wabiz_client/shared/shared_pref_provider.dart';
import 'package:wabiz_client/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final pref = await SharedPreferences.getInstance();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(pref),
      ],
      child: const MainApp(),
    ),
  );
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
