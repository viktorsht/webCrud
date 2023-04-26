import 'dart:convert';
import 'package:crudweb/src/api/api.dart';
import 'package:crudweb/src/models/user_model.dart';
import 'package:http/http.dart' as http;

class RegisterRepository{

  Future<User> postUserApi(User user) async {
    final url = Uri.parse(DataApi.mockapiUrl);
    final response = await http.post(
      url, 
      body: user.toJson(),
    );
    return User.fromJson(jsonDecode(response.body));
  }
  
}