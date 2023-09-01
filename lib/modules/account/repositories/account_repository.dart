import 'package:simple_bank_app/modules/account/models/account_model.dart';
import 'package:simple_bank_app/modules/account/models/create_account_model.dart';

abstract class AccountRepository {
  Future<AccountModel> findAccount(int accountId);
  Future<AccountModel> createAccount(CreateAccountModel createAccountModel);
}
