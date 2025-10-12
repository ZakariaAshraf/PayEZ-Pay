import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payez_pay/data/transaction_model.dart';

class TransactionItem extends StatelessWidget {
  final TransactionModel transaction;
  const TransactionItem({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(20),
        ),
        child: ListTile(
          trailing: Text("${transaction.amount}", style: theme.titleSmall),
          leading: Image.asset(
            "assets/icons/transfer.png",
            width: 40.w,
            height: 40.h,
          ),
          subtitle: Text(formatTimestamp(transaction.date)),
          title: Text(transaction.description, style: theme.titleMedium),
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    return "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
  }

  String formatTimestamp(Timestamp timestamp) {
    DateTime date = timestamp.toDate();
    return _formatDate(date);
  }
}
