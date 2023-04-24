import 'package:crudweb/src/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme{
  static ThemeData get theme => ThemeData(
    fontFamily: 'Nunito Sans',
    primaryColor: AppColors.primaryColorApp,
  );

  static ThemeData get themeDark => ThemeData(
    fontFamily: 'Nunito Sans',
    primaryColor: const Color.fromARGB(255, 56, 56, 56),
  );
}