class User{
  final String id;
  final String name;
  final String telefone;
  final String nascimento;
  final String email;

  User({required this.id, required this.name, required this.telefone,required this.email, required this.nascimento});

  factory User.fromJson(Map json){
    return User(
      id: json['id'], 
      name: json['name'], 
      telefone: json['telefone'], 
      nascimento: json['nascimento'], 
      email: json['email'],
    );
  }

  Map toJson(){
    return {
      'id': id,
      'name' : name,
      'telefone' : telefone,
      'email' : email,
      'nascimento' : nascimento,
    };
  }
}