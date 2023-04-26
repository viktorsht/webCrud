import 'package:crudweb/src/models/user_model.dart';
import 'package:crudweb/src/repositories/user_repository.dart';
import 'package:flutter/material.dart';

class EditController{
  final _repository = UserRepository();
  User user = User();
  final state = ValueNotifier <HomeState>(HomeState.start);

  Future start(String idUser) async {
    state.value = HomeState.loading;
    try {
      user = await _repository.updateUserApi(idUser);
      state.value = HomeState.sucess;
    } catch (e) {
      state.value = HomeState.error;
    }
  }

}

enum HomeState {start, loading, sucess, error}