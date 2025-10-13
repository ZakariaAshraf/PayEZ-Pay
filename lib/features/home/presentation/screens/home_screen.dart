import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payez_pay/data/transaction_model.dart';
import 'package:payez_pay/features/add_money/presentation/screens/add_money_screen.dart';
import 'package:payez_pay/features/home/presentation/widgets/home_screen_button.dart';
import 'package:payez_pay/features/home/presentation/widgets/refer_section.dart';
import 'package:payez_pay/features/home/presentation/widgets/transactions_section.dart';
import 'package:payez_pay/features/home/presentation/widgets/user_info_section.dart';
import 'package:payez_pay/features/pay_bills/presentation/screens/pay_bills_screen.dart';
import 'package:payez_pay/features/profile/presentation/Cubit/user_cubit.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<TransactionModel> transactions = TransactionModel.mockTransactions;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserCubit()..listenToUserData(),
      child: Scaffold(
        body: BlocBuilder<UserCubit, UserState>(
          builder: (context, state) {
            if (state is UserLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is UserLoaded) {
              return ListView(
                children: [
                  UserInfoSection(user: state.user),

                  /// -Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      HomeScreenButton(
                        title: "Top Up",
                        iconData: CupertinoIcons.plus,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>AddMoneyScreen(),
                            ),
                          );
                        },
                      ),
                      HomeScreenButton(
                        title: "Pay Bills",
                        iconData: Icons.payment,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PayBillsScreen(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),

                  /// -refer section
                  ReferSection(),

                  /// -recent transaction section
                  SizedBox(
                    height: 300,
                    child: TransactionsSection(),
                  ),
                ],
              );
            } else if (state is UserError) {
              return Center(child: Text(state.message));
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
