import '../account_module.dart';

abstract class FindAccount {
  Future<AccountModel> call(int accountId);
}
