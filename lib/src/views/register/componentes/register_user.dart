import 'package:crudweb/src/controllers/register_controller.dart';
import 'package:crudweb/src/models/user_model.dart';
import 'package:flutter/material.dart';

class RegisterUser extends StatefulWidget {
  final User user;

  const RegisterUser({super.key, required this.user});

  @override
  State<RegisterUser> createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {

  final controller = RegisterController();

  _sucess(){
    return const Center(
      child: Text("Ok")
    );
  }

  _start(User user){
    return Container();
  }

  _loading(){
    return const Center(child: CircularProgressIndicator());
  }

  _error(User user){
    return Center(
      child: ElevatedButton(
        onPressed: () {
          controller.start(user);
        },
        child: const Text("Tentar Novamente"),
      ),
    );
  }
  
  stateManager(HomeState state, User user){
    switch (state) {
      case HomeState.start:
        return _start(user);
      case HomeState.error:
        return _error(user);
      case HomeState.sucess:
        return _sucess();
      case HomeState.loading:
        return _loading();
      default:
        return _start(user);
    }
  }

  @override
  void initState() {
    super.initState();
    controller.start(widget.user);
  }
  
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller.state,
      builder:(context, child) => stateManager(controller.state.value, widget.user),
    );
  }
}