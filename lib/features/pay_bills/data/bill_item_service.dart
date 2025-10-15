import 'package:flutter/cupertino.dart';

import '../../../l10n/app_localizations.dart';
import 'bill_item_model.dart';

class BillItemService {
  static List<BillItemModel> getBillItems(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return [
      BillItemModel(
        iconPath: "assets/icons/electricity.png",
        name: l10n.electricity,
        companyName: 'East Delta',
      ),
      BillItemModel(
        iconPath: "assets/icons/water.png",
        name: l10n.water,
        companyName: 'Cairo Global Water',
      ),
      BillItemModel(
        iconPath: "assets/icons/internet.png",
        name: l10n.internet,
        companyName: 'We Network',
      ),
      BillItemModel(
        iconPath: "assets/icons/gas.png",
        name: l10n.gas,
        companyName: 'Cairo Global Gas',
      ),
    ];
  }

  static List<BillItemModel> getMobileRechargeBills(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return [
      BillItemModel(
        iconPath: "assets/icons/vodafone.png",
        name: l10n.vodafone,
        companyName: l10n.vodafone,
        isMobilRecharge: true,
      ),
      BillItemModel(
        iconPath: "assets/icons/orange.png",
        name: l10n.orange,
        companyName: l10n.orange,
        isMobilRecharge: true,
      ),
      BillItemModel(
        iconPath: "assets/icons/we.png",
        name: l10n.we,
        companyName: l10n.we,
        isMobilRecharge: true,
      ),
      BillItemModel(
        iconPath: "assets/icons/e&.png",
        name: l10n.etisalat,
        companyName: l10n.etisalat,
        isMobilRecharge: true,
      ),
    ];
  }
}
