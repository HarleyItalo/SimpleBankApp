import '../../common/common_module.dart';
import '../transaction_module.dart';

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
