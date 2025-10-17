// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get welcome => 'Welcome';

  @override
  String get settings => 'Settings';

  @override
  String get search => 'Search';

  @override
  String get themeMode => 'Theme Mode';

  @override
  String get language => 'Language';

  @override
  String price(Object price) {
    return '$price EGP';
  }

  @override
  String get topUp => 'Top Up';

  @override
  String get payBills => 'Pay Bills';

  @override
  String get transactions => 'Transactions';

  @override
  String get mobileNumber => 'Mobile Number';

  @override
  String get billAccountNumber => 'Bill / Account Number';

  @override
  String get amount => 'Amount';

  @override
  String get confirmPay => 'CONFIRM & PAY';

  @override
  String get processing => 'Processing..';

  @override
  String get paymentSuccess => 'Payment success';

  @override
  String get insufficientFunds => 'Insufficient funds';

  @override
  String get pleaseFillThis => 'Please fill this';

  @override
  String get electricity => 'Electricity';

  @override
  String get water => 'Water';

  @override
  String get internet => 'Internet';

  @override
  String get gas => 'Gas';

  @override
  String get vodafone => 'Vodafone';

  @override
  String get orange => 'Orange';

  @override
  String get we => 'We';

  @override
  String get etisalat => 'Etisalat';

  @override
  String get topUpBalance => 'Top Up Balance';

  @override
  String get addMoney => 'Add Money';

  @override
  String get addMoneyConfirmation => 'Add Money Confirmation';

  @override
  String get topUpId => 'Top up ID';

  @override
  String get topUpFee => 'Top up fee';

  @override
  String get continuee => 'Continue';

  @override
  String get free => 'Free';

  @override
  String get time => 'Time';

  @override
  String get confirmTopUp => 'Confirm Top Up';

  @override
  String get updateSuccess => 'Update success';

  @override
  String get updateFailed => 'Update Failed';

  @override
  String get bills => 'Bills';

  @override
  String get mobileBills => 'Mobile Bills';

  @override
  String get mobileRecharge => 'Mobile Recharge';

  @override
  String get changePassword => 'Change Password';

  @override
  String get editProfile => 'Edit Profile';

  @override
  String get logout => 'logout';

  @override
  String get pleaseWriteEmail => 'Please write your Email Address';

  @override
  String get email => 'Email';

  @override
  String get fullName => 'Full Name';

  @override
  String get phoneNumber => 'Phone Number';

  @override
  String get saveChanges => 'Save Changes';

  @override
  String get profileUpdatedSuccessfully => 'Profile updated successfully!';

  @override
  String get egp => 'EGP';

  @override
  String get goodMorning => 'Good Morning!';

  @override
  String hi(Object name) {
    return 'Hi, $name';
  }

  @override
  String get totalBalance => 'Total balance';

  @override
  String get inviteFriendEarnCashback => 'Invite a friend and both earn cashback';

  @override
  String get inviteFriend => 'Invite friend -->';

  @override
  String get recentTransactions => 'Recent Transactions';

  @override
  String get seeAll => 'See All';

  @override
  String get noTransactions => 'No Transactions';

  @override
  String error(Object error) {
    return 'Error: $error';
  }

  @override
  String get password => 'Password';

  @override
  String get forgetPassword => 'Forget Password ?';

  @override
  String get login => 'Login';

  @override
  String get dontHaveAccount => 'Don\'t have an account';

  @override
  String get create => 'Create!';

  @override
  String get register => 'Register';

  @override
  String get alreadyHaveAccount => 'Already have an account';

  @override
  String get loginFailed => 'Login failed Please check your email or password';

  @override
  String get registerFailed => 'Register failed please check all fields';
}
