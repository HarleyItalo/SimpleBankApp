import 'package:mobx/mobx.dart';
import 'package:simple_bank_app/main.dart';
import 'package:simple_bank_app/modules/common/common_module.dart';
import 'package:simple_bank_app/modules/transaction/transaction_module.dart';
part 'transaction_store.g.dart';

class TransactionStore = TransactionStoreBase with _$TransactionStore;

abstract class TransactionStoreBase with Store {
  @observable
  double balance = 0;

  @observable
  ObservableList<Transactions> transactions = ObservableList.of([]);

  @action
  Future getBalance(int accountId) async {
    var balanceModel = await serviceLocator.transactionModule
        .findBalance(accountId: accountId);
    balance = balanceModel.balance ?? 0.0;
  }

  @action
  Future getTransactions(int accountId) async {
    var transactionsModel = await serviceLocator.transactionModule
        .allTransactionsByAccount(accountId: accountId);
    transactions = ObservableList.of(transactionsModel.transactions ?? []);
  }

  @action
  Future reload(int accountId) async {
    Future.wait([
      getTransactions(accountId),
      getBalance(accountId),
    ]);
  }

  @action
  Future<BaseResponseModel> credit(int accountId, double value) async {
    var response = await serviceLocator.transactionModule
        .createCreditTransaction(accountId: accountId, value: value);
    await reload(accountId);
    return response;
  }

  @action
  Future<BaseResponseModel> debit(int accountId, double value) async {
    var response = await serviceLocator.transactionModule
        .createDebitTransaction(accountId: accountId, value: value);
    await reload(accountId);
    return response;
  }
}
