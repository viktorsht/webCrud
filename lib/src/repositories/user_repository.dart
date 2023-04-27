import 'dart:convert';
import 'package:crudweb/src/api/api.dart';
import 'package:crudweb/src/models/user_model.dart';
import 'package:http/http.dart' as http;

class UserRepository{

  Future<List<User>> getListUsersApi() async {
    final url = Uri.parse(DataApi.mockapiUrl);
    final response = await http.get(url);
    final list = jsonDecode(response.body) as List;
    return list.map((json) => User.fromJson(json)).toList();
  }

  Future<User> postUserApi(User user) async {
    final url = Uri.parse(DataApi.mockapiUrl);
    final response = await http.post(
      url, 
      body: user.toJson(),
    );
    return User.fromJson(jsonDecode(response.body));
  }

  Future<User> updateUserApi(User user) async {
    final url = Uri.parse('${DataApi.mockapiUrl}/${user.id}');
    final response = await http.put(url, body: user.toJson());
    return User.fromJson(jsonDecode(response.body));
  }

  Future<User> deleteUserApi(String idUser) async {
    final url = Uri.parse('${DataApi.mockapiUrl}/$idUser}');
    final response = await http.delete(url);
    return User.fromJson(jsonDecode(response.body));
  }  
}