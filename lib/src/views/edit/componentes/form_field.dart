
import 'package:crudweb/src/controllers/edit_controller.dart';
import 'package:crudweb/src/models/user_model.dart';
import 'package:crudweb/src/routers/routers_app.dart';
import 'package:crudweb/src/theme/app_buttons.dart';
import 'package:crudweb/src/theme/app_colors.dart';
import 'package:flutter/material.dart';


class EditFormField extends StatefulWidget {
  final User user;
  const EditFormField({super.key, required this.user});

  @override
  State<EditFormField> createState() => _EditFormFieldState();
}

class _EditFormFieldState extends State<EditFormField> {

    final TextEditingController controllerNome = TextEditingController();
    final TextEditingController controllerTelefone = TextEditingController();
    final TextEditingController controllerEmail = TextEditingController();
    final TextEditingController controllerNascimento = TextEditingController();

    final controller = EditController();


  @override
  void initState() {
    super.initState();
    controllerNome.text = widget.user.name!;
    controllerTelefone.text = widget.user.telefone!;
    controllerEmail.text = widget.user.email!;
    controllerNascimento.text = widget.user.nascimento!;
  }

  @override
  void dispose() {
    controllerNome.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        padding: const EdgeInsets.all(35),
        child: Column(
          children: [
            TextFormField(
              controller: controllerNome,
              decoration: const InputDecoration(label: Text('Nome')),
              validator: (value) => value!.isEmpty ? "Por favor, insira seu nome." : null,
            ),
            TextFormField(
              controller: controllerTelefone,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(label: Text('Telefone')),
              validator: (value) => value!.isEmpty ? "Por favor, insira seu Telefone." : null,
            ),
            TextFormField(
              controller: controllerEmail,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(label: Text('Email')),
              validator: (value) => value!.isEmpty ? "Por favor, insira seu Email." : null,
            ),
            TextFormField(
              controller: controllerNascimento,
              keyboardType: TextInputType.datetime,
              decoration: const InputDecoration(label: Text('Data de nascimento')),
              validator: (value) => value!.isEmpty ? "Por favor, insira sua data de nascimento." : null,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Row(
                  children: [
                    ElevatedButton(
                      style: ButtonApp.themeButtonAppPrimary,
                      onPressed: (){
                        Navigator.of(context).pushReplacementNamed(RoutersApp.home);
                      }, 
                      child: const Text('Cancelar', style: TextStyle(color: AppColors.blackColorApp, fontWeight: FontWeight.w500),),
                    ),
                    const SizedBox(width: 10,),
                    ElevatedButton(
                      style: ButtonApp.themeButtonAppPrimary,
                      onPressed: (){
                        final user = User(
                          name: controllerNome.text, 
                          telefone: controllerTelefone.text,
                          email: controllerEmail.text,
                          nascimento: controllerNascimento.text,
                          id: widget.user.id
                        );
                        controller.start(user);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Usuário atualizado com sucesso!', style: TextStyle(color: AppColors.blackColorApp, fontWeight: FontWeight.w500),),
                            backgroundColor: AppColors.notificationColorApp,
                            behavior: SnackBarBehavior.floating,
                          ),
                        );
                        Navigator.of(context).pushNamed(RoutersApp.home);
                      }, 
                      child: const Text('Salvar', style: TextStyle(color: AppColors.blackColorApp, fontWeight: FontWeight.w500),),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}