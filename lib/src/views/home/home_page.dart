import 'package:crudweb/src/controllers/home_controller.dart';
import 'package:crudweb/src/routers/routers_app.dart';
import 'package:crudweb/src/theme/app_buttons.dart';
import 'package:crudweb/src/theme/app_colors.dart';
import 'package:crudweb/src/views/home/componentes/home_list_user.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final controller = HomeController();

  _sucess(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 16), // espaço entre o botão e a appBar
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Container(
            alignment: Alignment.centerLeft,
            child: ElevatedButton(
              style: ButtonApp.themeButtonAppPrimary,
              onPressed: () {
                Navigator.of(context).pushNamed(RoutersApp.register);
              },
              child: const Text('Add User', style: TextStyle(color: AppColors.blackColorApp, fontWeight: FontWeight.w500),),
            ),
          ),
        ),
        const SizedBox(height: 16), // espaço entre o botão e a ListView
        Expanded(
          child: Align(
            alignment: Alignment.center,
            child: ListView.builder(
              itemCount: controller.users.length,
              itemBuilder: (BuildContext context, int index) {
                return ListUser(user: controller.users[index]);
              },
            ),
          ),
        ),
      ],
    );
  }

  _start(){
    return Container();
  }

  _loading(){
    return const Center(child: CircularProgressIndicator());
  }

  _error(){
    return Center(
      child: ElevatedButton(
        onPressed: () {
          controller.start();
        },
        child: const Text("Tentar Novamente"),
      ),
    );
  }
  
  stateManager(HomeState state){
    switch (state) {
      case HomeState.start:
        return _start();
      case HomeState.error:
        return _error();
      case HomeState.sucess:
        return _sucess();
      case HomeState.loading:
        return _loading();
      default:
        return _start();
    }
  }

  @override
  void initState() {
    super.initState();
    controller.start();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.secundaryColorApp,
        title: const Text("CRUD WEB", 
          style: TextStyle(
              color: AppColors.blackColorApp,
              fontWeight: FontWeight.bold,
              fontSize: 25
            ),
          ),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: (){}, 
            color: AppColors.blackColorApp,
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: AnimatedBuilder(
        animation: controller.state,
        builder:(context, child) => stateManager(controller.state.value),
      )
    );
  }
}