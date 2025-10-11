import 'package:flutter/cupertino.dart';
import 'package:payez_pay/features/transaction_history/data/bill_item_model.dart';

class BillItemService {
  static List<BillItemModel> getBillItems(BuildContext context) {
    return [
      BillItemModel(
        iconPath: "assets/icons/electricity.png",
        name: "Electricity",
        companyName: 'East Cairo',
      ),
      BillItemModel(
        iconPath: "assets/icons/water.png",
        name: "Water",
        companyName: 'Cairo Global Water',
      ),
      BillItemModel(
        iconPath: "assets/icons/internet.png",
        name: "Internet",
        companyName: 'Cairo Global Water',
      ),
      BillItemModel(
        iconPath: "assets/icons/gas.png",
        name: "Gas",
        companyName: 'Cairo Global Water',
      ),
    ];
  }

  static List<BillItemModel> getMobileRechargeBills(BuildContext context) {
    return [
      BillItemModel(
        iconPath: "assets/icons/vodafone.png",
        name: "Vodafone",
        companyName: 'Vodafone',
        isMobilRecharge: true,
      ),
      BillItemModel(
        iconPath: "assets/icons/orange.png",
        name: "Orange",
        companyName: 'Orange',
        isMobilRecharge: true,
      ),
      BillItemModel(
        iconPath: "assets/icons/we.png",
        name: "We",
        companyName: 'We',
        isMobilRecharge: true,
      ),
      BillItemModel(
        iconPath: "assets/icons/e&.png",
        name: "Etisalat",
        companyName: 'Etisalat',
        isMobilRecharge: true,
      ),
    ];
  }
}
