enum UsetType {
  PARTICULAR, PROFESSIONAL
}

class User {
  String id;
  String name;
  String email;
  String phone;
  String password;
  UsetType type;
  DateTime createdAt;

  User({this.name, this.email, this.phone, this.password, this.type = UsetType.PARTICULAR, this.id, this.createdAt});
}