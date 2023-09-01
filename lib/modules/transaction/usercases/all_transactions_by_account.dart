import '../transaction_module.dart';

abstract class AllTransactionsByAccount {
  Future<AllTransactionsModel> call({required int accountId});
}
