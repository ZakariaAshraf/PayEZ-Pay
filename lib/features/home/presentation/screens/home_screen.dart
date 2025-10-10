import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payez_pay/data/transaction_model.dart';
import 'package:payez_pay/data/user_model.dart';
import 'package:payez_pay/features/add_money/presentation/screens/add_money_screen.dart';
import 'package:payez_pay/features/home/presentation/widgets/home_screen_button.dart';
import 'package:payez_pay/features/home/presentation/widgets/refer_section.dart';
import 'package:payez_pay/features/home/presentation/widgets/transactions_section.dart';
import 'package:payez_pay/features/home/presentation/widgets/user_info_section.dart';

import '../../../transaction_history/presentation/screens/transaction_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final UserModel user = UserModel.mockUser;
  final List<TransactionModel> transactions = TransactionModel.mockTransactions;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          UserInfoSection(user: user),

          /// -Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              HomeScreenButton(
                title: "Top Up",
                iconData: CupertinoIcons.plus,
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AddMoneyScreen(),));
                },
              ),
              HomeScreenButton(
                title: "Pay Bills",
                iconData: Icons.payment,
                onTap: () {},
              ),
            ],
          ),

          /// -refer section
          ReferSection(),
          /// -recent transaction section

          SizedBox(
            height: 300,
            child: TransactionsSection(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        TransactionScreen(transactions: transactions),
                  ),
                );
              },
              transactions: transactions,
            ),
          ),
        ],
      ),
    );
  }
}
