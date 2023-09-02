// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TransactionStore on TransactionStoreBase, Store {
  late final _$balanceAtom =
      Atom(name: 'TransactionStoreBase.balance', context: context);

  @override
  double get balance {
    _$balanceAtom.reportRead();
    return super.balance;
  }

  @override
  set balance(double value) {
    _$balanceAtom.reportWrite(value, super.balance, () {
      super.balance = value;
    });
  }

  late final _$transactionsAtom =
      Atom(name: 'TransactionStoreBase.transactions', context: context);

  @override
  ObservableList<Transactions> get transactions {
    _$transactionsAtom.reportRead();
    return super.transactions;
  }

  @override
  set transactions(ObservableList<Transactions> value) {
    _$transactionsAtom.reportWrite(value, super.transactions, () {
      super.transactions = value;
    });
  }

  late final _$getBalanceAsyncAction =
      AsyncAction('TransactionStoreBase.getBalance', context: context);

  @override
  Future<dynamic> getBalance(int accountId) {
    return _$getBalanceAsyncAction.run(() => super.getBalance(accountId));
  }

  late final _$getTransactionsAsyncAction =
      AsyncAction('TransactionStoreBase.getTransactions', context: context);

  @override
  Future<dynamic> getTransactions(int accountId) {
    return _$getTransactionsAsyncAction
        .run(() => super.getTransactions(accountId));
  }

  late final _$reloadAsyncAction =
      AsyncAction('TransactionStoreBase.reload', context: context);

  @override
  Future<dynamic> reload(int accountId) {
    return _$reloadAsyncAction.run(() => super.reload(accountId));
  }

  late final _$creditAsyncAction =
      AsyncAction('TransactionStoreBase.credit', context: context);

  @override
  Future<BaseResponseModel> credit(int accountId, double value) {
    return _$creditAsyncAction.run(() => super.credit(accountId, value));
  }

  late final _$debitAsyncAction =
      AsyncAction('TransactionStoreBase.debit', context: context);

  @override
  Future<BaseResponseModel> debit(int accountId, double value) {
    return _$debitAsyncAction.run(() => super.debit(accountId, value));
  }

  @override
  String toString() {
    return '''
balance: ${balance},
transactions: ${transactions}
    ''';
  }
}
