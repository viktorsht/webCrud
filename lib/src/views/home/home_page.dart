import 'package:crudweb/src/controllers/home_controller.dart';
import 'package:crudweb/src/models/user_model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final bool _loadedData = false;

  List<User> usersList = [];
  UsersAppController usersAppController = UsersAppController();

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    usersList = await usersAppController.getListUserApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HOME PAGE"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: usersList.length,
        itemBuilder: (BuildContext context, int index){ 
          return _loadedData ? const CircularProgressIndicator() : Text(usersList[index].name);
        }
      ),
    );
  }
}