import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payez_pay/config/utils/app_colors.dart';
import 'package:payez_pay/data/transactions_services.dart';
import '../../../transaction_history/presentation/screens/transaction_screen.dart';
import '../../../transaction_history/presentation/widgets/transaction_item.dart';

class TransactionsSection extends StatelessWidget {
  final TransactionsService service = TransactionsService();

  TransactionsSection({super.key});

  final String userId = FirebaseAuth.instance.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).textTheme;
    return StreamBuilder(
      stream: service.getTransactionHistory(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text("Error: ${snapshot.error}");
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return SizedBox(
            height: 250.h,
            child: Center(child: CircularProgressIndicator()),
          );
        }

        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text("Recent Transactions", style: theme.titleMedium),
                  ],
                ),
              ),
              Center(child: Text("\n\n\n No Transactions", style: theme.titleMedium)),
            ],
          );
        }
        final transactions = snapshot.data!;
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Recent Transactions", style: theme.titleMedium),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              TransactionScreen(transactions: transactions),
                        ),
                      );
                    },
                    child: Text(
                      "See All",
                      style: theme.titleMedium!.copyWith(
                        color: AppColors.primaryDeepOceanBlue,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: transactions.isEmpty ? 0 : 1,
              itemBuilder: (context, index) =>
                  TransactionItem(transaction: transactions[index]),
            ),
          ],
        );
      },
    );
  }
}
