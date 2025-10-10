import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String uid;
  final String name;
  final String email;
  final double balance;

  UserModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.balance,
  });

  static UserModel get mockUser => UserModel(
    uid: 'mock_user_id_123',
    name: 'Ahmed',
    email: 'test@example.com',
    balance: 1250.75,
  );

  factory UserModel.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data();
    return UserModel(
      uid: snapshot.id,
      name: data?['name'] ?? '',
      email: data?['email'] ?? '',
      balance: (data?['balance'] ?? 0).toDouble(),
    );
  }
  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'email': email,
      'balance': balance,
    };
  }
}
