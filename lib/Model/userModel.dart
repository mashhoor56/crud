class UserModel {
  String id;
  String name;
  String uid;

  UserModel({required this.id, required this.name, required this.uid});

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "uid": uid,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
        id: map["id"].toString(),
        name: map["name"].toString(),
        uid: map["uid"].toString());
  }
  UserModel copyWith({
    String? id,
    String? name,
    String? uid,
  }) {
    return UserModel(
        id: id ?? this.id, name: name ?? this.name, uid: uid ?? this.uid);
  }
}
