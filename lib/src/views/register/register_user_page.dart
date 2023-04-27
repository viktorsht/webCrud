import 'package:crudweb/src/controllers/register_controller.dart';
import 'package:crudweb/src/models/user_model.dart';
import 'package:crudweb/src/theme/app_buttons.dart';
import 'package:crudweb/src/theme/app_colors.dart';
import 'package:flutter/material.dart';

import '../../routers/routers_app.dart';

class RegisterUserPage extends StatefulWidget {
  const RegisterUserPage({super.key});

  @override
  State<RegisterUserPage> createState() => _RegisterUserPageState();
}

class _RegisterUserPageState extends State<RegisterUserPage> {
  
  final _controllerNome = TextEditingController();
  final _controllerTelefone = TextEditingController();
  final _controllerEmail = TextEditingController();
  final _controllerNascimento = TextEditingController();

  final controller = RegisterController();

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppColors.secundaryColorApp,
        iconTheme: const IconThemeData(color: AppColors.blackColorApp),
        title: const Text(
          'Cadastro', 
          style: TextStyle(
            color: AppColors.blackColorApp,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
      ),
      body: Form(
        child: Container(
          padding: const EdgeInsets.all(35),
          child: Column(
            children: [
              TextFormField(
                controller: _controllerNome,
                decoration: const InputDecoration(label: Text('Nome')),
                validator: (value) => value!.isEmpty ? 'Por favor, insira seu nome.' : null,
              ),
              TextFormField(
                controller: _controllerTelefone,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(label: Text('Telefone')),
                validator: (value) => value!.isEmpty ? 'Por favor, insira seu Telefone.' : null,
              ),
              TextFormField(
                controller: _controllerEmail,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(label: Text('Email')),
                validator: (value) => value!.isEmpty ? 'Por favor, insira seu Email.' : null,
              ),
              TextFormField(
                controller: _controllerNascimento,
                keyboardType: TextInputType.datetime,
                decoration: const InputDecoration(label: Text('Data de nascimento')),
                validator: (value) => value!.isEmpty ? 'Por favor, insira sua data de nascimento.' : null,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
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
                          name: _controllerNome.text, 
                          telefone: _controllerTelefone.text,
                          email: _controllerEmail.text,
                          nascimento: _controllerNascimento.text,
                        );
                        controller.start(user);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Usuário cadastrado com sucesso!', style: TextStyle(color: AppColors.blackColorApp, fontWeight: FontWeight.w500),),
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
            ],
          ),
        )
      ),
    );
  }
}