import '../transaction_module.dart';

class AllTransactionsByAccountImpl implements AllTransactionsByAccount {
  final TransactionsRepository _repository;
  AllTransactionsByAccountImpl(this._repository);
  @override
  Future<AllTransactionsModel> call({required int accountId}) async {
    return _repository.allTransactionsByAccount(accountId: accountId);
  }
}
