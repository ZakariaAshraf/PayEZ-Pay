import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payez_pay/features/transaction_history/data/bill_item_model.dart';
import '../../../../config/utils/app_colors.dart';
import '../../../../widgets/primary_button.dart';

class BillDetailsScreen extends StatelessWidget {
  final BillItemModel billItemModel;

  const BillDetailsScreen({super.key, required this.billItemModel});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).textTheme;
    TextEditingController billNumberController = TextEditingController();
    TextEditingController amountController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("${billItemModel.name} Bill", style: theme.titleLarge),
      ),
      body: Column(
        children: [
          SizedBox(height: 60.h,),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(billItemModel.iconPath, width: 45.w, height: 45.h),
                SizedBox(width: 15.w,),
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
                    billItemModel.isMobilRecharge ?"Mobile Number" :"Bill / Account Number" ,
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
                      val == null || val.isEmpty ? 'Please fill this' : null,
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
                    "Amount",
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
            child: PrimaryButton(
              title: " CONFIRM & PAY",
              onTap: () {},
              color: AppColors.secondaryAquaBreeze,
            ),
          ),
        ],
      ),
    );
  }
}
