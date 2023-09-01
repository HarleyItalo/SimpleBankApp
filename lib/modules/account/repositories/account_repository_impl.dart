import '../../common/common_module.dart';
import '../account_module.dart';

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
