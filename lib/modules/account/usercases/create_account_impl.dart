import 'package:simple_bank_app/modules/account/account_module.dart';

class CreateAccountImpl implements CreateAccount {
  final AccountRepository _repository;
  CreateAccountImpl(this._repository);

  @override
  Future<AccountModel> call(CreateAccountModel createAccountModel) {
    return _repository.createAccount(createAccountModel);
  }
}
