part of 'add_funds_cubit.dart';

@immutable
sealed class AddFundsState {}

final class AddFundsInitial extends AddFundsState {}
final class AddFundsLoading extends AddFundsState {}
final class AddFundsSuccess extends AddFundsState {}
final class AddFundsError extends AddFundsState {
  final String errorMessage;

  AddFundsError({required this.errorMessage});
}
