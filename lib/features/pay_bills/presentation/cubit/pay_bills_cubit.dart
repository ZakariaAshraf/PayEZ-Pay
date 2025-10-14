import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../data/transactions_services.dart';

part 'pay_bills_state.dart';

class PayBillsCubit extends Cubit<PayBillsState> {
  PayBillsCubit() : super(PayBillsInitial());
  TransactionsService service = TransactionsService();

  payBill({required double paymentAmount, required String billDescription,}) async {
    emit(PayBillsLoading());
    try {
      await service.processBillPayment(
        paymentAmount: paymentAmount,
        billDescription: billDescription,
      );
      emit(PayBillsSuccess());
    } on Exception catch (e) {
      emit(PayBillsError(errorMessage: e.toString()));
    }
  }
}
