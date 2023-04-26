import 'package:crudweb/src/models/user_model.dart';
import 'package:crudweb/src/repositories/user_repository.dart';
import 'package:flutter/material.dart';

class HomeController{
  List<User> users = [];
  final _repository = UserRepository();
  final state = ValueNotifier <HomeState>(HomeState.start);

  Future start() async {
    state.value = HomeState.loading;
    try {
      users = await _repository.getListUserApi();
      state.value = HomeState.sucess;
    } catch (e) {
      state.value = HomeState.error;
    }
  }

}

enum HomeState {start, loading, sucess, error}