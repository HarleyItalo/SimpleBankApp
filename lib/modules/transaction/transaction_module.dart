export 'models/all_transactions_model.dart';
export 'models/balance_model.dart';
export 'models/create_transaction_model.dart';
export 'repositories/transactions_repository.dart';
export 'usercases/all_transactions_by_account.dart';
export 'usercases/create_credit_transaction.dart';
export 'usercases/create_debit_transaction.dart';
export 'usercases/find_balance.dart';
export 'repositories/transactions_repository_impl.dart';
export 'usercases/all_transactions_by_account_impl.dart';
export 'usercases/create_credit_transaction_impl.dart';
export 'package:simple_bank_app/modules/base_module.dart';
export 'usercases/create_debit_transaction_impl.dart';
export 'usercases/find_balance_impl.dart';
import 'transaction_module.dart';

class TransactionModule extends BaseModule {
  TransactionModule({required super.instance});
  late AllTransactionsByAccount allTransactionsByAccount;
  late CreateCreditTransaction createCreditTransaction;
  late CreateDebitTransaction createDebitTransaction;
  late FindBalance findBalance;
  @override
  Future init() async {
    allTransactionsByAccount = await instance.getAsync();
    createCreditTransaction = await instance.getAsync();
    createDebitTransaction = await instance.getAsync();
    findBalance = await instance.getAsync();
  }

  @override
  Future injectModule() async {
    instance.registerLazySingletonAsync<TransactionsRepository>(
      () async => TransactionsRepositoryImpl(
        await instance.getAsync(),
      ),
    );
    instance.registerLazySingletonAsync<AllTransactionsByAccount>(
      () async => AllTransactionsByAccountImpl(
        await instance.getAsync(),
      ),
    );
    instance.registerLazySingletonAsync<CreateCreditTransaction>(
      () async => CreateCreditTransactionImpl(
        await instance.getAsync(),
      ),
    );
    instance.registerLazySingletonAsync<CreateDebitTransaction>(
      () async => CreateDebitTransactionImpl(
        await instance.getAsync(),
      ),
    );
    instance.registerLazySingletonAsync<FindBalance>(
      () async => FindBalanceImpl(
        await instance.getAsync(),
      ),
    );
  }
}
