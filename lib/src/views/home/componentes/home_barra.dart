import 'package:crudweb/src/theme/app_buttons.dart';
import 'package:crudweb/src/theme/app_colors.dart';
import 'package:flutter/material.dart';

class HomeBarra extends StatelessWidget {
  const HomeBarra({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          ElevatedButton(
            onPressed: (){}, 
            style: ButtonApp.themeButtonAppSecundary,
            child: const Text("Adicinar usuário", style: TextStyle(color: AppColors.blackColorApp),)
            ),
        ],
      ),
    );
  }
}