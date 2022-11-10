import 'dart:convert';

class User {
  String name;
  String lastName;
  String userName;
  String password;
  String description;

  User({
    required this.name,
    required this.lastName,
    required this.userName,
    required this.password,
    this.description = "",
  });

  factory User.fromJsonString(String jsonString) {
    final map = jsonDecode(jsonString) as Map<String, dynamic>;
    return User(
      name: map['name'] as String,
      lastName: map['lastName'] as String,
      userName: map['userName'] as String,
      password: map['password'] as String,
      description: map['description'] as String,
    );
  }

  String toJsonString() {
    final map = <String, dynamic>{
      'name': name,
      'lastName': lastName,
      'userName': userName,
      'password': password,
      'description': description,
    };
    return jsonEncode(map);
  }

  @override
  String toString() {
    return 'User{name: $name, lastName: $lastName, userName: $userName, password: $password, description: $description}';
  }
}
