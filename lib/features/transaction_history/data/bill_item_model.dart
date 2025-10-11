class BillItemModel {
  final String iconPath;
  final String name;
  final String companyName;
  final bool isMobilRecharge;

  BillItemModel({required this.iconPath, required this.name,required this.companyName ,this.isMobilRecharge =false});

}