import 'package:mobx/mobx.dart';
import 'package:simple_bank_app/main.dart';
import 'package:simple_bank_app/modules/transaction/transaction_module.dart';
part 'transaction_store.g.dart';

class TransactionStore = TransactionStoreBase with _$TransactionStore;

abstract class TransactionStoreBase with Store {
  @observable
  double balance = 0;

  @observable
  ObservableList<Transactions> transactions = ObservableList.of([]);

  Future getBalance(int accountId) async {
    var balanceModel = await serviceLocator.transactionModule
        .findBalance(accountId: accountId);
    balance = balanceModel.balance ?? 0.0;
  }

  Future getTransactions(int accountId) async {
    var transactionsModel = await serviceLocator.transactionModule
        .allTransactionsByAccount(accountId: accountId);
    transactions = ObservableList.of(transactionsModel.transactions ?? []);
  }
}
