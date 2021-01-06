import 'dart:convert';

class UserModel {
  final String email;
  final String name;
  final String uid;
  UserModel({
    this.email,
    this.name,
    this.uid,
  });
  

  UserModel copyWith({
    String email,
    String name,
    String uid,
  }) {
    return UserModel(
      email: email ?? this.email,
      name: name ?? this.name,
      uid: uid ?? this.uid,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'name': name,
      'uid': uid,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return UserModel(
      email: map['email'],
      name: map['name'],
      uid: map['uid'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));

  @override
  String toString() => 'UserModel(email: $email, name: $name, uid: $uid)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is UserModel &&
      o.email == email &&
      o.name == name &&
      o.uid == uid;
  }

  @override
  int get hashCode => email.hashCode ^ name.hashCode ^ uid.hashCode;
}
