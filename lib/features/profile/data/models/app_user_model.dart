import 'package:cloud_firestore/cloud_firestore.dart';

class AppUserModel {
  final String name;
  final String phone;
  final DateTime createdAt;
  final String ?photoUrl;
  final double balance;

  AppUserModel({
    required this.name,
    required this.phone,
    required this.createdAt,
     this.photoUrl,
    required this.balance,
  });

  factory AppUserModel.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return AppUserModel(
      name: data['name'],
      phone: data['phone'],
      createdAt: data['createdAt'].toDate(),
      photoUrl: data['photoUrl'], balance: data['balance'],
    );
  }
}