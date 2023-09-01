import '../transaction_module.dart';
import '../../common/common_module.dart';

class CreateDebitTransactionImpl implements CreateDebitTransaction {
  final TransactionsRepository _repository;
  CreateDebitTransactionImpl(this._repository);

  @override
  Future<BaseResponseModel> call(
      {required int accountId, required double value}) async {
    return _repository.createDebitTransaction(
      CreateTransactionsModel(
        accountId: accountId,
        value: value,
      ),
    );
  }
}
