import '../account_module.dart';

abstract class AccountRepository {
  Future<AccountModel> findAccount(int accountId);
  Future<AccountModel> createAccount(CreateAccountModel createAccountModel);
}
