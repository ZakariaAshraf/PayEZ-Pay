// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get welcome => 'مرحباً';

  @override
  String get settings => 'الاعدادات';

  @override
  String get search => 'بحث';

  @override
  String get themeMode => 'وضع الالوان';

  @override
  String get language => 'اللغه';

  @override
  String price(Object price) {
    return '$price جنيه';
  }

  @override
  String get topUp => 'شحن الرصيد';

  @override
  String get payBills => 'دفع الفواتير';

  @override
  String get transactions => 'المعاملات';

  @override
  String get mobileNumber => 'رقم الهاتف المحمول';

  @override
  String get billAccountNumber => 'رقم الفاتورة / الحساب';

  @override
  String get amount => 'المبلغ';

  @override
  String get confirmPay => 'تأكيد ودفع';

  @override
  String get processing => 'جاري المعالجة..';

  @override
  String get paymentSuccess => 'تم الدفع بنجاح';

  @override
  String get insufficientFunds => 'رصيد غير كافي';

  @override
  String get pleaseFillThis => 'يرجى ملء هذا الحقل';

  @override
  String get electricity => 'الكهرباء';

  @override
  String get water => 'المياه';

  @override
  String get internet => 'الانترنت';

  @override
  String get gas => 'الغاز';

  @override
  String get vodafone => 'فودافون';

  @override
  String get orange => 'اورنج';

  @override
  String get we => 'وي';

  @override
  String get etisalat => 'اتصالات';

  @override
  String get topUpBalance => 'شحن الرصيد';

  @override
  String get addMoney => 'إضافة أموال';

  @override
  String get addMoneyConfirmation => 'تأكيد إضافة الأموال';

  @override
  String get topUpId => 'معرف الشحن';

  @override
  String get topUpFee => 'رسوم الشحن';

  @override
  String get continuee => 'متابعة';

  @override
  String get free => 'مجاني';

  @override
  String get time => 'الوقت';

  @override
  String get confirmTopUp => 'تأكيد الشحن';

  @override
  String get updateSuccess => 'تم التحديث بنجاح';

  @override
  String get updateFailed => 'فشل التحديث';

  @override
  String get bills => 'الفواتير';

  @override
  String get mobileBills => 'فواتير المحمول';

  @override
  String get mobileRecharge => 'شحن المحمول';

  @override
  String get changePassword => 'تغيير كلمة المرور';

  @override
  String get editProfile => 'تعديل الملف الشخصي';

  @override
  String get logout => 'تسجيل الخروج';

  @override
  String get pleaseWriteEmail => 'يرجى كتابة عنوان بريدك الإلكتروني';

  @override
  String get email => 'البريد الإلكتروني';

  @override
  String get fullName => 'الاسم الكامل';

  @override
  String get phoneNumber => 'رقم الهاتف';

  @override
  String get saveChanges => 'حفظ التغييرات';

  @override
  String get profileUpdatedSuccessfully => 'تم تحديث الملف الشخصي بنجاح!';

  @override
  String get egp => 'جنيه';

  @override
  String get goodMorning => 'صباح الخير!';

  @override
  String hi(Object name) {
    return 'مرحباً، $name';
  }

  @override
  String get totalBalance => 'الرصيد الإجمالي';

  @override
  String get inviteFriendEarnCashback => 'ادع صديقاً وستحصلان على استرداد نقدي';

  @override
  String get inviteFriend => 'ادع صديقاً -->';

  @override
  String get recentTransactions => 'المعاملات الأخيرة';

  @override
  String get seeAll => 'عرض الكل';

  @override
  String get noTransactions => 'لا توجد معاملات';

  @override
  String error(Object error) {
    return 'خطأ: $error';
  }

  @override
  String get password => 'كلمة المرور';

  @override
  String get forgetPassword => 'نسيت كلمة المرور؟';

  @override
  String get login => 'تسجيل الدخول';

  @override
  String get dontHaveAccount => 'ليس لديك حساب';

  @override
  String get create => 'إنشاء!';

  @override
  String get register => 'تسجيل';

  @override
  String get alreadyHaveAccount => 'لديك حساب بالفعل';

  @override
  String get loginFailed => 'فشل تسجيل الدخول يرجى التحقق من البريد الإلكتروني أو كلمة المرور';

  @override
  String get registerFailed => 'فشل التسجيل يرجى التحقق من جميع الحقول';
}
