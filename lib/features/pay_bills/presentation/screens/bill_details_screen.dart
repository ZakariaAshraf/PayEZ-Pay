import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payez_pay/features/pay_bills/presentation/cubit/pay_bills_cubit.dart';
import '../../../../config/utils/app_colors.dart';
import '../../../../widgets/custom_toast_widget.dart';
import '../../../../widgets/primary_button.dart';
import '../../../../l10n/app_localizations.dart';
import '../../data/bill_item_model.dart';

class BillDetailsScreen extends StatelessWidget {
  final BillItemModel billItemModel;

  const BillDetailsScreen({super.key, required this.billItemModel});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).textTheme;
    final l10n = AppLocalizations.of(context);
    TextEditingController billNumberController = TextEditingController();
    TextEditingController amountController = TextEditingController();
    return BlocListener<PayBillsCubit, PayBillsState>(
      listener: (context, state) {
        if (state is PayBillsSuccess) {
          Navigator.pop(context);
          CustomToastWidget.show(
            context: context,
            title: l10n!.paymentSuccess,
            iconPath: billItemModel.iconPath,
          );
        } else if (state is PayBillsError) {
          Navigator.pop(context);
          CustomToastWidget.show(
            context: context,
            title: l10n.insufficientFunds,
            iconPath: billItemModel.iconPath,
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("${billItemModel.name} ${l10n!.bills}", style: theme.titleLarge),
        ),
        body: Column(
          children: [
            SizedBox(height: 60.h),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    billItemModel.iconPath,
                    color: billItemModel.isMobilRecharge ? Colors.transparent : Colors.white,
                    width: 45.w,
                    height: 45.h,
                  ),
                  SizedBox(width: 15.w),
                  Text(billItemModel.companyName, style: theme.titleMedium),
                ],
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      billItemModel.isMobilRecharge
                          ? l10n!.mobileNumber
                          : l10n.billAccountNumber,
                      style: theme.titleSmall!.copyWith(color: Colors.grey),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    maxLines: 1,
                    controller: billNumberController,
                    style: theme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 25.sp,
                    ),
                    keyboardType: TextInputType.numberWithOptions(),
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                    validator: (val) =>
                        val == null || val.isEmpty ? l10n!.pleaseFillThis : null,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      l10n!.amount,
                      style: theme.titleSmall!.copyWith(color: Colors.grey),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    maxLines: 1,
                    controller: amountController,
                    style: theme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 25.sp,
                    ),
                    keyboardType: TextInputType.numberWithOptions(),
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.attach_money,
                        color: Colors.grey,
                        size: 30,
                      ),
                      suffix: Text("🇪🇬 ${l10n!.egp}"),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                    validator: (val) =>
                        val == null || val.isEmpty ? l10n!.pleaseFillThis : null,
                  ),
                ),
              ],
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: BlocBuilder<PayBillsCubit, PayBillsState>(
                builder: (context, state) {
                  final isLoading = state is PayBillsLoading;
                  return PrimaryButton(
                    title: isLoading ? l10n!.processing : l10n.confirmPay,
                    onTap: () {
                      context.read<PayBillsCubit>().payBill(
                        paymentAmount: double.parse(amountController.text),
                        billDescription: billItemModel.toString(),
                      );
                    },
                    color: AppColors.secondaryAquaBreeze,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
