class UserModel {
  String? uid;
  late String name;
  late String email;
  String? image;
  String? cover;
  late String bio;
  late bool isEmailVerify;
  UserModel({
    this.uid,
    required this.name,
    required this.email,
    this.image,
    this.cover,
    required this.bio,
    required this.isEmailVerify,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    name = json['name'];
    email = json['email'];
    image = json['image'];
    cover = json['cover'];
    bio = json['bio'];
    isEmailVerify = json['isEmailVerify'];
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'image': image,
      'cover': cover,
      'bio': bio,
      'isEmailVerify': isEmailVerify,
    };
  }
}
