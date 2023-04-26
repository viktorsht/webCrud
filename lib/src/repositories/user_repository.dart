import 'dart:convert';
import 'package:crudweb/src/api/api.dart';
import 'package:crudweb/src/models/user_model.dart';
import 'package:http/http.dart' as http;

class UserRepository{

  Future<List<User>> getListUserApi() async {
    final url = Uri.parse(DataApi.mockapiUrl);
    final response = await http.get(url);
    final list = jsonDecode(response.body) as List;
    return list.map((json) => User.fromJson(json)).toList();
  }
  
}