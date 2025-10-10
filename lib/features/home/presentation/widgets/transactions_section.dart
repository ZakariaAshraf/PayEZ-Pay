import 'package:flutter/material.dart';
import 'package:payez_pay/config/utils/app_colors.dart';
import 'package:payez_pay/data/transaction_model.dart';

import '../../../transaction_history/presentation/widgets/transaction_item.dart';

class TransactionsSection extends StatelessWidget {
  final List<TransactionModel> transactions;
  final void Function() onTap;

  const TransactionsSection({
    super.key,
    required this.transactions,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).textTheme;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Recent Transactions", style: theme.titleMedium),
              TextButton(
                onPressed: onTap,
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
          itemCount: 2,
          itemBuilder: (context, index) => TransactionItem(transaction: transactions[index],),
        ),

      ],
    );
  }
}
