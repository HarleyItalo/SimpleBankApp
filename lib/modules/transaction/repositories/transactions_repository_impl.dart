import 'package:simple_bank_app/modules/common/models/base_response.dart';
import 'package:simple_bank_app/modules/common/services/http_service.dart';
import 'package:simple_bank_app/modules/transaction/models/all_transactions_model.dart';
import 'package:simple_bank_app/modules/transaction/models/balance_model.dart';
import 'package:simple_bank_app/modules/transaction/models/create_transaction_model.dart';
import 'package:simple_bank_app/modules/transaction/repositories/transactions_repository.dart';

class TransactionsRepositoryImpl extends TransactionsRepository {
  final HttpService _httpService;

  TransactionsRepositoryImpl(this._httpService);
  @override
  Future<AllTransactionsModel> allTransactionsByAccount(
      {required int accountId}) async {
    var json = await _httpService.get(path: "Transactions/ByUser/$accountId");
    return AllTransactionsModel.fromJson(json);
  }

  @override
  Future<BaseResponseModel> createCreditTransaction(
      CreateTransactionsModel model) async {
    var json = await _httpService.post(
        path: "Transactions/Credit", body: model.toJson());
    return BaseResponseModel.fromJson(json);
  }

  @override
  Future<BaseResponseModel> createDebitTransaction(
      CreateTransactionsModel model) async {
    var json = await _httpService.post(
        path: "Transactions/Debit", body: model.toJson());
    return BaseResponseModel.fromJson(json);
  }

  @override
  Future<BalanceModel> findBalance({required int accountId}) async {
    var json = await _httpService.get(path: "Transactions/balance/$accountId");
    return BalanceModel.fromJson(json);
  }
}
