class MyUser {
  const MyUser({
    required this.id,
    required this.balance,
    required this.email,
    required this.endPoint,
    required this.startPoint,
    required this.qrCodeData,
  });

  factory MyUser.fromMap(Map<String, dynamic> map, String id) {
    return MyUser(
      id: id,
      balance: map['balance'] as String,
      email: map['email'] as String,
      endPoint: map['endPoint'] as String,
      startPoint: map['startPoint'] as String,
      qrCodeData: map['qrCodeData'] as String,
    );
  }

  final String id;
  final String balance;
  final String email;
  final String endPoint;
  final String startPoint;
  final String qrCodeData;
}