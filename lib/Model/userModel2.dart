class UserModel2 {
  String name;
  String email;
  String password;
  String password2;
  UserModel2(
      {required this.name,
      required this.email,
      required this.password,
      required this.password2});
  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "email": email,
      "password": password,
      "password2": password2,
    };
  }

  factory UserModel2.fromMap(Map<String, dynamic> map) {
    return UserModel2(
        email: map["email"].toString(),
        name: map["name"].toString(),
        password: map["password"].toString(),
        password2: map["password2"].toString());
  }
  UserModel2 copyWith({
    String? name,
    String? email,
    String? password,
    String? password2,
  }) {
    return UserModel2(
        name: name ?? this.name,
        email: email ?? this.email,
        password: password ?? this.password,
        password2: password2 ?? this.password2);
  }
}
