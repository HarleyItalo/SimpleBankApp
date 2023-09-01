export 'package:simple_bank_app/modules/account/repositories/account_repository.dart';
export 'package:simple_bank_app/modules/account/repositories/account_repository_impl.dart';
export 'package:simple_bank_app/modules/account/usercases/create_account.dart';
export 'package:simple_bank_app/modules/account/models/account_model.dart';
export 'package:simple_bank_app/modules/account/models/create_account_model.dart';
export 'package:simple_bank_app/modules/account/usercases/create_account_impl.dart';
export 'package:simple_bank_app/modules/account/usercases/find_account.dart';
export 'package:simple_bank_app/modules/account/usercases/find_account_impl.dart';

import 'package:simple_bank_app/modules/base_module.dart';
import 'package:simple_bank_app/modules/account/account_module.dart';

class AccountModule extends BaseModule {
  AccountModule({required super.instance});
  late CreateAccount createAccount;
  late FindAccount findAccount;
  @override
  Future init() async {
    createAccount = await instance.getAsync();
    findAccount = await instance.getAsync();
  }

  @override
  Future injectModule() async {
    instance.registerLazySingletonAsync<AccountRepository>(
      () async => AccountRepositoryImpl(
        await instance.getAsync(),
      ),
    );
    instance.registerLazySingletonAsync<CreateAccount>(
      () async => CreateAccountImpl(
        await instance.getAsync(),
      ),
    );
    instance.registerLazySingletonAsync<FindAccount>(
      () async => FindAccountImpl(
        await instance.getAsync(),
      ),
    );
  }
}
