class UserModel {
  String? id;
  String fullname;
  String email;
  String password;

  UserModel({
    this.id,
    required this.fullname,
    required this.email,
    required this.password,
  });
  Map<String, dynamic> toJson() => {
        "id": id,
        "fullName": fullname,
        "email": email,
      };
}
