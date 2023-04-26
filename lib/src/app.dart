import 'package:crudweb/src/routers/routers_app.dart';
import 'package:crudweb/src/theme/app_theme.dart';
import 'package:crudweb/src/views/home/home_page.dart';
import 'package:crudweb/src/views/register/register_user.dart';
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
      initialRoute: RoutersApp.root,
      routes: {
        RoutersApp.root : (context) => const HomePage(),
        RoutersApp.home : (context) => const HomePage(),
        RoutersApp.register : (context) => const RegisterUser(),
      },
    );
  }
}