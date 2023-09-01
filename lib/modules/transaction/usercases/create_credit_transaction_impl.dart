import '../transaction_module.dart';
import '../../common/common_module.dart';

class CreateCreditTransactionImpl implements CreateCreditTransaction {
  final TransactionsRepository _repository;
  CreateCreditTransactionImpl(this._repository);

  @override
  Future<BaseResponseModel> call(
      {required int accountId, required double value}) async {
    return _repository.createCreditTransaction(
      CreateTransactionsModel(
        accountId: accountId,
        value: value,
      ),
    );
  }
}
