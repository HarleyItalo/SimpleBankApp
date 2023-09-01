import 'package:simple_bank_app/modules/common/models/base_response.dart';
import 'package:simple_bank_app/modules/transaction/models/all_transactions_model.dart';
import 'package:simple_bank_app/modules/transaction/models/create_transaction_model.dart';

abstract class TransactionsRepository {
  Future<AllTransactionsModel> allTransactionsByAccount(
      {required int accountId});
  Future<BaseResponseModel> createDebitTransaction(
      CreateTransactionsModel model);
}
