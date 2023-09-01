import '../transaction_module.dart';

class FindBalanceImpl implements FindBalance {
  final TransactionsRepository _repository;
  FindBalanceImpl(this._repository);

  @override
  Future<BalanceModel> call({required int accountId}) async {
    return _repository.findBalance(accountId: accountId);
  }
}
