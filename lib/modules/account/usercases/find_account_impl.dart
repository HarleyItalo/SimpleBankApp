import 'package:simple_bank_app/modules/account/account_module.dart';

class FindAccountImpl implements FindAccount {
  final AccountRepository _repository;
  FindAccountImpl(this._repository);
  @override
  Future<AccountModel> call(int accountId) {
    return _repository.findAccount(accountId);
  }
}
