import 'package:mobx/mobx.dart';
import 'package:simple_bank_app/main.dart';
import 'package:simple_bank_app/modules/account/account_module.dart';
import 'package:simple_bank_app/modules/common/utils/string_util.dart';
part 'account_store.g.dart';

class AccountStore = AccountStoreBase with _$AccountStore;

abstract class AccountStoreBase with Store {
  @observable
  String accountNumber = '';

  @observable
  Account? account;

  @action
  setAccountNumber(String number) {
    accountNumber = StringUtil.onlyNumbers(number);
  }

  Future getAccount(int accountId) async {
    var accountModel = await serviceLocator.accountModule.findAccount(
      accountId,
    );
    account = accountModel.account;
  }
}
