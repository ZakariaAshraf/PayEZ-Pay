part of 'pay_bills_cubit.dart';

@immutable
sealed class PayBillsState {}

final class PayBillsInitial extends PayBillsState {}
final class PayBillsLoading extends PayBillsState {}
final class PayBillsSuccess extends PayBillsState {}
final class PayBillsError extends PayBillsState {
  final String errorMessage;

  PayBillsError({required this.errorMessage});

}
