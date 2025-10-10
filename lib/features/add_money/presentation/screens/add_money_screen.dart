import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payez_pay/config/utils/app_colors.dart';
import 'package:payez_pay/widgets/custom_text_field.dart';
import 'package:payez_pay/widgets/primary_button.dart';

import '../../../../widgets/custom_button.dart';

class AddMoneyScreen extends StatelessWidget {
  AddMoneyScreen({super.key});

  final TextEditingController balanceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Top Up Balance", style: theme.titleLarge),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
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
          PrimaryButton(
            title: "Continue",
            onTap: () {},
            color: AppColors.secondaryAquaBreeze,
          ),
        ],
      ),
    );
  }
}
