class MyUser {
  const MyUser({
    required this.id,
    required this.balance,
    required this.contactNumber,
    required this.email,
    required this.name,
    required this.endPoint,
    required this.startPoint,
    required this.fee,
  });

  factory MyUser.fromMap(Map<String, dynamic> map, String id) {
    return MyUser(
      id: id,
      balance: map['balance'] as String,
      contactNumber: map['contactNumber'] as String,
      email: map['email'] as String,
      name: map['name'] as String,
      endPoint: map['endPoint'] as String,
      startPoint: map['startPoint'] as String,
      fee: map['fee'] as String,
    );
  }

  final String id;
  final String balance;
  final String contactNumber;
  final String email;
  final String name;
  final String endPoint;
  final String startPoint;
  final String fee;
}