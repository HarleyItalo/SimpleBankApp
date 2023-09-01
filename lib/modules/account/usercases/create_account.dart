import '../account_module.dart';

abstract class CreateAccount {
  Future<AccountModel> call(CreateAccountModel createAccountModel);
}
