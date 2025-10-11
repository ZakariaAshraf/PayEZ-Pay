import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payez_pay/features/pay_bills/presentation/screens/bill_details_screen.dart';
import 'package:payez_pay/features/pay_bills/presentation/widgets/bill_item.dart';
import 'package:payez_pay/features/transaction_history/data/bill_item_model.dart';
import 'package:payez_pay/features/transaction_history/data/bill_item_service.dart';

class PayBillsScreen extends StatelessWidget {
  const PayBillsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).textTheme;
    List<BillItemModel> bills = BillItemService.getBillItems(context);
    List<BillItemModel> mobileRechargeBills =
        BillItemService.getMobileRechargeBills(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Pay Bills", style: theme.titleLarge),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Select a service to pay for: ",
                  style: theme.titleMedium!.copyWith(color: Colors.grey),
                ),
              ),
            ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: bills.length,
              itemBuilder: (context, index) => BillItem(model: bills[index]),
            ),
            Card(
              child: ExpansionTile(
                leading: CircleAvatar(
                  child: Image.asset(
                    "assets/icons/mobile.png",
                    width: 35.w,
                    height: 35.h,
                  ),
                ),
                title: Text("Mobile Recharge"),
                children: List.generate(mobileRechargeBills.length, (index) => BillItem(model: mobileRechargeBills[index]),),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
