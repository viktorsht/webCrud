import 'package:crudweb/src/controllers/remove_controller.dart';
import 'package:crudweb/src/routers/routers_app.dart';
import 'package:crudweb/src/theme/app_colors.dart';
import 'package:crudweb/src/views/edit/componentes/form_field.dart';
import 'package:crudweb/src/views/edit/edit_user_page.dart';
import 'package:flutter/material.dart';

import '../../../models/user_model.dart';

class ListUser extends StatelessWidget {

  final User user;
  const ListUser({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0),
      leading: const Icon(Icons.person),
      title: Text("Nome: ${user.name}   Telefone: ${user.telefone} - ID: ${user.id}"),
      subtitle: Text("Email: ${user.email}"),
      trailing: SizedBox(
        width: 100,
        child: Row(
          children: [
            IconButton(
              onPressed: (){
                //Navigator.of(context).pushNamed(RoutersApp.edit);
                Navigator.push(context, MaterialPageRoute(builder: (context) => EditUserPage(usuario: user)));
              }, 
              color: AppColors.editColorApp,
              icon: const Icon(Icons.edit),
            ),
            const SizedBox(width: 20,),
            IconButton(
              onPressed: (){
                final controller = RemoveController();
                controller.start(user.id!);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Usuário removido com sucesso!', style: TextStyle(color: AppColors.blackColorApp, fontWeight: FontWeight.w500),),
                    backgroundColor: AppColors.notificationColorApp,
                    behavior: SnackBarBehavior.floating
                  ),
                );
                Navigator.of(context).pushNamed(RoutersApp.home);
              }, 
              color: AppColors.removeColorApp,
              icon: const Icon(Icons.delete),
            ),
          ],
        ),
      ),
    );
  }
}