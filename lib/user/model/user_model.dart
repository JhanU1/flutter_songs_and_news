import 'dart:convert';

class User {
  String name;
  String lastName;
  String userName;
  String password;
  String email;
  String description;

  User({
    required this.name,
    required this.lastName,
    required this.userName,
    required this.password,
    required this.email,
    this.description = "",
  });

  factory User.fromJsonString(String jsonString) {
    final map = json.decode(jsonString) as Map<String, dynamic>;
    return User(
      name: map['name'] as String,
      lastName: map['lastName'] as String,
      userName: map['userName'] as String,
      password: map['password'] as String,
      email: map['email'] as String,
      description: map['description'] as String,
    );
  }

  String toJsonString() {
    final map = <String, dynamic>{
      'name': name,
      'lastName': lastName,
      'userName': userName,
      'password': password,
      'email': email,
      'description': description,
    };
    return map.toString();
  }

  @override
  String toString() {
    return 'User{name: $name, lastName: $lastName, userName: $userName, password: $password, email: $email, description: $description}';
  }
}
