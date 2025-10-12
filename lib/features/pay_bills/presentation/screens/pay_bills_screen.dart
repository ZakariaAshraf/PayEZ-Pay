import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payez_pay/config/utils/app_colors.dart';
import 'package:payez_pay/features/pay_bills/presentation/widgets/bill_item.dart';
import 'package:payez_pay/features/transaction_history/data/bill_item_model.dart';
import 'package:payez_pay/features/transaction_history/data/bill_item_service.dart';

class PayBillsScreen extends StatefulWidget {
  const PayBillsScreen({super.key});
  @override
  State<PayBillsScreen> createState() => _PayBillsScreenState();
}

class _PayBillsScreenState extends State<PayBillsScreen> {
  String? _selectedCategory;
  static const List<String> billTypes = ["Bills", "Mobile Bills"];

  @override
  void initState() {
    _selectedCategory = billTypes[0];
    super.initState();
  }

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Select a service to pay for: ",
                style: theme.titleMedium!.copyWith(color: Colors.grey),
              ),
            ),
            SizedBox(
              height: 60,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: billTypes.length,
                itemBuilder: (context, index) {
                  final category = billTypes[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: FilterChip(
                      side: BorderSide.none,
                      showCheckmark: false,
                      label: Text(category),
                      selected: _selectedCategory == category,
                      onSelected: (selected) {
                        setState(() {
                          _selectedCategory = category;
                        });
                      },
                      labelStyle: TextStyle(
                        fontWeight: _selectedCategory == category
                            ? FontWeight.bold
                            : FontWeight.normal,
                        fontSize: _selectedCategory == category ? 16.sp : 14.sp,
                        color: _selectedCategory == category
                            ? Colors.white
                            : Colors.black,
                      ),
                      backgroundColor: Colors.grey[200],
                      selectedColor: AppColors.primaryDeepOceanBlue,
                    ),
                  );
                },
              ),
            ),
            if (_selectedCategory == "Bills")
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: bills.length,
                itemBuilder: (context, index) => BillItem(model: bills[index]),
              )
            else if (_selectedCategory == "Mobile Bills")
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: ExpansionTile(
                    leading: CircleAvatar(
                      child: Image.asset(
                        "assets/icons/mobile.png",
                        width: 35.w,
                        height: 35.h,
                      ),
                    ),
                    title: const Text("Mobile Recharge"),
                    children: List.generate(
                      mobileRechargeBills.length,
                          (index) => BillItem(model: mobileRechargeBills[index]),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}