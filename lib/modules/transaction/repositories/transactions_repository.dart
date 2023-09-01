import '../../common/common_module.dart';
import '../transaction_module.dart';

abstract class TransactionsRepository {
  Future<AllTransactionsModel> allTransactionsByAccount({
    required int accountId,
  });
  Future<BaseResponseModel> createDebitTransaction(
      CreateTransactionsModel model);
  Future<BaseResponseModel> createCreditTransaction(
      CreateTransactionsModel model);
  Future<BalanceModel> findBalance({
    required int accountId,
  });
}
