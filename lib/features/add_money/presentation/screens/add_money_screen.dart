import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payez_pay/config/utils/app_colors.dart';
import 'package:payez_pay/features/add_money/presentation/cubit/add_funds_cubit.dart';
import 'package:payez_pay/widgets/primary_button.dart';

import '../../../../widgets/custom_toast_widget.dart';

class AddMoneyScreen extends StatelessWidget {
  AddMoneyScreen({super.key});

  final TextEditingController balanceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).textTheme;
    void showBottomSheet({required void Function() onTap}) {
      showModalBottomSheet(
        enableDrag: false,
        context: context,
        builder: (context) {
          return DraggableScrollableSheet(
            initialChildSize: 0.80,
            minChildSize: 0.50,
            expand: false,
            maxChildSize: 1,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                padding: const EdgeInsets.all(14),
                height: 140,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                ),
                child: ListView(
                  controller: scrollController,
                  children: [
                    Center(
                      child: Container(
                        height: 6,
                        width: 42,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      "Add Money Confirmation",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 12.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Top up ID",
                          style: theme.titleSmall!.copyWith(color: Colors.grey),
                        ),
                        Text("1000000XXX", style: theme.titleSmall),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Amount",
                          style: theme.titleSmall!.copyWith(color: Colors.grey),
                        ),
                        Text(
                          "${balanceController.text}EGP",
                          style: theme.titleSmall,
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Top up fee",
                          style: theme.titleSmall!.copyWith(color: Colors.grey),
                        ),
                        Text(
                          "Free",
                          style: theme.titleSmall!.copyWith(
                            color: AppColors.primaryDeepOceanBlue,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Time",
                          style: theme.titleSmall!.copyWith(color: Colors.grey),
                        ),
                        Text("${DateTime.now()}", style: theme.titleSmall),
                      ],
                    ),
                    SizedBox(height: 40.h),
                    PrimaryButton(
                      title: "Confirm Top Up",
                      color: AppColors.secondaryAquaBreeze,
                      onTap: onTap,
                    ),
                  ],
                ),
              );
            },
          );
        },
      );
    }

    return BlocListener<AddFundsCubit, AddFundsState>(
      listener: (context, state) {
        if (state is AddFundsSuccess) {
          CustomToastWidget.show(
            context: context,
            title: "Update success",
            iconPath: "assets/icons/logo.png",
          );
          Navigator.pop(context);
        } else if (state is AddFundsError) {
          Navigator.pop(context);
          CustomToastWidget.show(
            context: context,
            title: "Update Failed",
            iconPath: "assets/icons/logo.png",
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Top Up Balance", style: theme.titleLarge),
        ),
        body: Column(
          children: [
            SizedBox(height: 50.h),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Add Money",
                      style: theme.titleSmall!.copyWith(color: Colors.grey),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    maxLines: 1,
                    controller: balanceController,
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
                      suffix: Text("🇪🇬 EGP"),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                    validator: (val) =>
                        val == null || val.isEmpty ? 'Please fill this' : null,
                  ),
                ),
              ],
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: BlocBuilder<AddFundsCubit, AddFundsState>(
                builder: (context, state) {
                  final isLoading = state is AddFundsLoading;
                  return PrimaryButton(
                    title: isLoading ? "Processing.." : "Continue"  ,
                    onTap: () {
                      showBottomSheet(
                        onTap: () {
                          Navigator.of(context).pop();
                          context.read<AddFundsCubit>().addFunds(
                            amountToAdd: double.parse(balanceController.text),
                          );
                        },
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
