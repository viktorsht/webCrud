import 'package:crudweb/src/theme/app_theme.dart';
import 'package:crudweb/src/views/home/home_page.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CRUD Básico',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      darkTheme: AppTheme.themeDark,
      initialRoute: '/',
      routes: {
        '/' : (_) =>const HomePage(),
        //'/login' :(context) => const LoginApp(),
      },
    );
  }
}