import 'package:mobx/mobx.dart';
part 'account_store.g.dart';

class AccountStore = AccountStoreBase with _$AccountStore;

abstract class AccountStoreBase with Store {}
