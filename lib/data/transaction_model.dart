import 'package:cloud_firestore/cloud_firestore.dart';

// Enum to define the type of transaction. Using an enum is safer than strings.
enum TransactionType { credit, debit }

/// Represents a single financial transaction.
/// This model is used for transaction history and tracking payments.
class TransactionModel {
  final String id;
  final String description;
  final double amount;
  final TransactionType type;
  final Timestamp date;

  TransactionModel({
    required this.id,
    required this.description,
    required this.amount,
    required this.type,
    required this.date,
  });

  /// Creates a list of mock transactions for UI testing.
  /// This allows you to populate lists and see how they look.
  static List<TransactionModel> get mockTransactions => [
    TransactionModel(
      id: 'txn_1',
      description: 'Orange Bill Payment',
      amount: 150.00,
      type: TransactionType.debit,
      date: Timestamp.fromDate(DateTime(2025, 10, 6, 11, 30)),
    ),
    TransactionModel(
      id: 'txn_2',
      description: 'Money Added',
      amount: 500.00,
      type: TransactionType.credit,
      date: Timestamp.fromDate(DateTime(2025, 10, 5, 21, 15)),
    ),
    TransactionModel(
      id: 'txn_3',
      description: 'WE Electricity',
      amount: 210.50,
      type: TransactionType.debit,
      date: Timestamp.fromDate(DateTime(2025, 10, 4, 14, 45)),
    ),
  ];

  factory TransactionModel.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data();
    return TransactionModel(
      id: snapshot.id,
      description: data?['description'] ?? 'Unknown Transaction',
      amount: (data?['amount'] ?? 0).toDouble(),
      // Safely determine the transaction type from the string in Firestore
      type: (data?['type'] == 'credit')
          ? TransactionType.credit
          : TransactionType.debit,
      date: data?['date'] ?? Timestamp.now(),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'description': description,
      'amount': amount,
      // Convert the enum back to a string for storage
      'type': type == TransactionType.credit ? 'credit' : 'debit',
      'date': date,
    };
  }
}
