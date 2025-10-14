class BillItemModel {
  final String iconPath;
  final String name;
  final String companyName;
  final bool isMobilRecharge;

  BillItemModel({required this.iconPath, required this.name,required this.companyName ,this.isMobilRecharge =false});

  @override
  String toString() {
    // TODO: implement toString
    if (isMobilRecharge) {
     return "$companyName Mobile Recharge Bill";
    }else {
      return  "$companyName Bill Payment" ;
    }
  }
}