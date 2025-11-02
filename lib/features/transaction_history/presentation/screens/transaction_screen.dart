import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payez_pay/l10n/app_localizations.dart';

import '../../../../data/transaction_model.dart';
import '../widgets/transaction_item.dart';

class TransactionScreen extends StatelessWidget {
  final List<TransactionModel> transactions;

  const TransactionScreen({super.key, required this.transactions});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).textTheme;
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(centerTitle: true,title: Text(l10n!.transactions,style: theme.titleLarge,),),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 400.w,
                child: CupertinoSearchTextField(
                  onChanged: (value) {},
                  style: theme.titleSmall,
                ),
              ),
            ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: transactions.length,
              itemBuilder: (context, index) =>
                  TransactionItem(transaction: transactions[index]),
            ),
          ],
        ),
      ),
    );
  }
}
