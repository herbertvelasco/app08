class UserModel {
  String? id;
  String fullname;
  String email;
  

  UserModel({
    this.id,
    required this.fullname,
    required this.email,
    
  });
  Map<String, dynamic> toJson() => {
        "id": id,
        "fullName": fullname,
        "email": email,
      };
}
