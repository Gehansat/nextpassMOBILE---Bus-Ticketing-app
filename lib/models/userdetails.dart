import 'dart:convert';

UserDetails articlesFromJson(String str) => UserDetails.fromJson(json.decode(str));

String articlesToJson(UserDetails data) => json.encode(data.toJson());

class UserDetails {
  UserDetails({
    required this.arrivingdate,
    required this.leavingdate,
    required this.name,
    required this.email,
    required this.visano,
    required this.contactno,
  });
    String arrivingdate;
  String leavingdate;
  String name;
  String email;
  String visano;
  String contactno;

  factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
        arrivingdate: json["arrivingdate"] ?? "",
        leavingdate: json["leavingdate"] ?? "",
        name: json["name"] ?? "",
        email: json["email"] ?? "",
        visano: json["visano"] ?? "",
        contactno: json["contactno"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "arrivingdate": arrivingdate,
        "leavingdate": leavingdate,
        "name": name,
        "email": email,
        "visano": visano,
        "contactno": contactno,
      };
}




