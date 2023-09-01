import 'package:simple_bank_app/modules/account/models/account_model.dart';
import 'package:simple_bank_app/modules/account/models/create_account_model.dart';
import 'package:simple_bank_app/modules/account/repositories/account_repository.dart';
import 'package:simple_bank_app/modules/common/services/http_service.dart';

class AccountRepositoryImpl implements AccountRepository {
  final HttpService _httpService;
  AccountRepositoryImpl(this._httpService);

  @override
  Future<AccountModel> findAccount(int accountId) async {
    var json = await _httpService.get(path: "Account/$accountId");
    return AccountModel.fromJson(json);
  }

  @override
  Future<AccountModel> createAccount(
      CreateAccountModel createAccountModel) async {
    var json = await _httpService.post(
        path: "Account/Create", body: createAccountModel.toJson());
    return AccountModel.fromJson(json);
  }
}
