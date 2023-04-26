class User {
  String? name;
  String? telefone;
  String? nascimento;
  String? email;
  String? id;

  User({this.name, this.telefone, this.nascimento, this.email, this.id});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    telefone = json['telefone'];
    nascimento = json['nascimento'];
    email = json['email'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['telefone'] = telefone;
    data['nascimento'] = nascimento;
    data['email'] = email;
    data['id'] = id;
    return data;
  }
}
