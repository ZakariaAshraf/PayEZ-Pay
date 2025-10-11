import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payez_pay/features/transaction_history/data/bill_item_model.dart';

import '../screens/bill_details_screen.dart';

class BillItem extends StatelessWidget {
  // final String? iconPath;

  // final void Function() navigationTap;
  final BillItemModel model;

  const BillItem({super.key,required this.model});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(20),
        ),
        child: ListTile(
          trailing: IconButton(
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      BillDetailsScreen(billItemModel: model),
                ),
              );
            },
            icon: Icon(Icons.arrow_forward_ios_outlined),
          ),
          leading: CircleAvatar(
            child: Image.asset(
              model.iconPath,
              width: 35.w,
              height: 35.h,
            ),
          ),
          title: Text(model.name),
        ),
      ),
    );
  }
}
