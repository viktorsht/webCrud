import 'dart:convert';
import 'package:crudweb/src/api/api.dart';
import 'package:crudweb/src/models/user_model.dart';
import 'package:http/http.dart' as http;

class UsersAppController{

  Future<List<User>> getListUserApi() async {
    final url = Uri.parse(DataApi.mockapiUrl);
    final response = await http.get(url, headers: {
        'Content-type': 'application/json',
      },);

    List<User> users = [];
    
    if (response.statusCode == 200) {
      final list = jsonDecode(response.body) as List;
      for (var json in list) {
        final recipiente = User.fromJson(json);
        users.add(recipiente);
      }
    }
    else {
      throw Exception('Erro na requisição: ${response.statusCode}');
    }
    return users;
  }
  
}