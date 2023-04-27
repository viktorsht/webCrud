import 'package:crudweb/src/models/user_model.dart';
import 'package:crudweb/src/theme/app_colors.dart';
import 'package:crudweb/src/views/edit/componentes/form_field.dart';
import 'package:flutter/material.dart';

class EditUserPage extends StatelessWidget {
  final User usuario;
  const EditUserPage({super.key, required this.usuario});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppColors.secundaryColorApp,
        title: Text(
          "Editar Usuário: ${usuario.id}", 
          style: TextStyle(
            color: AppColors.blackColorApp,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
      ),
      body: EditFormField(user: usuario),
    );
  }
}