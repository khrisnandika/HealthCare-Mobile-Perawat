class UserModel {
  String? uid;
  String? fullname;
  String? no_str;
  String? profesi;
  String? email;
  String? profilepic;

  UserModel({this.uid, this.fullname, this.no_str, this.profesi, this.email, this.profilepic});

  UserModel.fromMap(Map<String, dynamic> map) {
    uid = map["uid"];
    fullname = map["fullname"];
    no_str = map['no_str'];
    profesi = map['profesi'];
    email = map["email"];
    profilepic = map["profilepic"];
  }

  Map<String, dynamic> toMap() {
    return {
      "uid": uid,
      "fullname": fullname,
      "no_str": no_str,
      "profesi": profesi,
      "email": email,
      "profilepic": profilepic,
    };
  }
}