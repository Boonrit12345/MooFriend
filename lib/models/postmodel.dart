import 'dart:convert';

class PostModel {
  final String namepost;
  final String post;
  final String uidpost;
  PostModel({
    this.namepost,
    this.post,
    this.uidpost,
  });

  PostModel copyWith({
    String namepost,
    String post,
    String uidpost,
  }) {
    return PostModel(
      namepost: namepost ?? this.namepost,
      post: post ?? this.post,
      uidpost: uidpost ?? this.uidpost,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'namepost': namepost,
      'post': post,
      'uidpost': uidpost,
    };
  }

  factory PostModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return PostModel(
      namepost: map['namepost'],
      post: map['post'],
      uidpost: map['uidpost'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PostModel.fromJson(String source) => PostModel.fromMap(json.decode(source));

  @override
  String toString() => 'PostModel(namepost: $namepost, post: $post, uidpost: $uidpost)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is PostModel &&
      o.namepost == namepost &&
      o.post == post &&
      o.uidpost == uidpost;
  }

  @override
  int get hashCode => namepost.hashCode ^ post.hashCode ^ uidpost.hashCode;
}
