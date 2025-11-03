import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:payez_pay/data/transactions_services.dart';

part 'add_funds_state.dart';

class AddFundsCubit extends Cubit<AddFundsState> {
  AddFundsCubit() : super(AddFundsInitial());

  TransactionsService service = TransactionsService();

  addFunds({required double amountToAdd}) async {
    emit(AddFundsLoading());
    if (await service.integrateBiometrics()) {
      try {
        await service.addFundsToWallet(amountToAdd: amountToAdd);
        emit(AddFundsSuccess());
      } on Exception catch (e) {
        emit(AddFundsError(errorMessage: e.toString()));
      }
    } else {
      emit(AddFundsError(errorMessage: "Please Authenticate first"));
    }
  }
}
