import 'package:crudweb/src/models/user_model.dart';
import 'package:crudweb/src/repositories/register_repository.dart';
import 'package:flutter/material.dart';

class RegisterController{
  final _repository = RegisterRepository();
  User user = User();
  final state = ValueNotifier <HomeState>(HomeState.start);

  Future start(User usuario) async {
    state.value = HomeState.loading;
    try {
      user = await _repository.postUserApi(usuario);
      print(user);
      state.value = HomeState.sucess;
    } catch (e) {
      print(e);
      state.value = HomeState.error;
    }
  }

}

enum HomeState {start, loading, sucess, error}