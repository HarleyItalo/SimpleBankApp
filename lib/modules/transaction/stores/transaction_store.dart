import 'package:mobx/mobx.dart';
part 'transaction_store.g.dart';

class TransactionStore = TransactionStoreBase with _$TransactionStore;

abstract class TransactionStoreBase with Store {}
