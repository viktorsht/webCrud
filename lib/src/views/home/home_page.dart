import 'package:crudweb/src/controllers/home_controller.dart';
import 'package:crudweb/src/models/user_model.dart';
import 'package:crudweb/src/theme/app_colors.dart';
import 'package:crudweb/src/views/home/componentes/home_barra.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool _loadedData = false;

  List<User> usersList = [];

  Future<void> loadData() async {
    List<User> lista = [];
    final usersAppController = UsersAppController();
    lista = await usersAppController.getListUserApi();
    setState(() {
    _loadedData = true;
      usersList = lista;
    });
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: AppColors.grayColorApp,
        title: const Text("HOME PAGE", 
          style: TextStyle(
              color: AppColors.blackColorApp,
              fontWeight: FontWeight.bold,
              fontSize: 25
            ),
          ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Expanded(
          child: ListView(
            children: [
              Container(color: AppColors.blackColorApp,)
            ]
          )
        ),
      ),
    );
  }
}


/*

!_loadedData ? const CircularProgressIndicator() : ListView.builder(
        itemCount: usersList.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Usuário: ${usersList[index].name}"),
            ],
          );
        },
      ),

*/