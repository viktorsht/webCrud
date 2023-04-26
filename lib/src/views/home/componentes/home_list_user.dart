import 'package:crudweb/src/theme/app_colors.dart';
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
      title: Text("Nome: ${user.name}   Telefone: ${user.telefone}"),
      subtitle: Text("Email: ${user.email}"),
      trailing: SizedBox(
        width: 100,
        child: Row(
          children: [
            IconButton(
              onPressed: (){}, 
              color: AppColors.editColorApp,
              icon: const Icon(Icons.edit),
            ),
            const SizedBox(width: 20,),
            IconButton(
              onPressed: (){}, 
              color: AppColors.removeColorApp,
              icon: const Icon(Icons.delete),
            ),
          ],
        ),
      ),
    );
  }
}