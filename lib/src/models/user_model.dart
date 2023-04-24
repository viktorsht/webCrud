class User{
  final int id;
  final String name;
  final String telefone;
  final String nascimento;

  User({required this.id, required this.name, required this.telefone, required this.nascimento});

  factory User.fromJson(Map json){
    return User(
      id: json['id'], 
      name: json['name'], 
      telefone: json['telefone'], 
      nascimento: json['nascimento'],
    );
  }

  Map toJson(){
    return {
      'id': id,
      'name' : name,
      'telefone' : telefone,
      'nascimento' : nascimento,
    };
  }
}