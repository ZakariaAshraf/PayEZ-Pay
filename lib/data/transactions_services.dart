import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:payez_pay/data/transaction_model.dart';

class TransactionsService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final String _usersCollection = 'users';

  Stream<List<TransactionModel>> getTransactionHistory() {
    String userId = FirebaseAuth.instance.currentUser!.uid;
    final transactionsRef = _db
        .collection(_usersCollection)
        .doc(userId)
        .collection('transactions')
        .orderBy(
          'date',
          descending: true,
        );

    return transactionsRef.snapshots().map((snapshot) {
      return snapshot.docs
          .map((doc) => TransactionModel.fromFirestore(doc))
          .toList();
    });
  }

  Future<void> addFundsToWallet({
    required double amountToAdd,
  }) async {
    String userId = FirebaseAuth.instance.currentUser!.uid;
    final userDocRef = _db.collection(_usersCollection).doc(userId);
    final transactionDocRef = userDocRef
        .collection('transactions')
        .doc();

    return _db.runTransaction((transaction) async {
      final snapshot = await transaction.get(userDocRef);
      final currentBalance = (snapshot.data()?['balance'] ?? 0).toDouble();

      // 2. Calculate the new balance
      final newBalance = currentBalance + amountToAdd;

      // 3. Create the transaction record for the added funds
      final newTransaction = TransactionModel(
        id: transactionDocRef.id,
        description: "Money Added",
        amount: amountToAdd,
        type: TransactionType.credit,
        date: Timestamp.now(),
      );

      transaction.update(userDocRef, {
        'balance': newBalance,
      });
      transaction.set(transactionDocRef, newTransaction.toFirestore());
    });
  }

  Future<void> processBillPayment({
    required double paymentAmount,
    required String billDescription,
  }) async {
    String userId = FirebaseAuth.instance.currentUser!.uid;
    final userDocRef = _db.collection(_usersCollection).doc(userId);
    final transactionDocRef = userDocRef.collection('transactions').doc();
    return _db.runTransaction((transaction) async {
      // 1. Read the user's current balance
      final snapshot = await transaction.get(userDocRef);
      final currentBalance = (snapshot.data()?['balance'] ?? 0).toDouble();

      // 2. Check for sufficient funds
      if (currentBalance < paymentAmount) {
        throw Exception("Insufficient funds. Please add money to your wallet.");
      }

      final newBalance = currentBalance - paymentAmount;

      final newTransaction = TransactionModel(
        id: transactionDocRef.id,
        description: billDescription,
        amount: paymentAmount,
        type: TransactionType.debit,
        date: Timestamp.now(),
      );

      // 5. Atomically update the balance and create the transaction log
      transaction.update(userDocRef, {'balance': newBalance});
      transaction.set(transactionDocRef, newTransaction.toFirestore());
    });
  }
}
