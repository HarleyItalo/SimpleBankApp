import 'package:http/http.dart';
import 'package:simple_bank_app/modules/account/account_module.dart';
import 'package:simple_bank_app/modules/common/common_module.dart';
import 'package:simple_bank_app/modules/transaction/transaction_module.dart';

class ServiceLocator {
  final instance = GetIt.instance;
  late AccountModule accountModule;
  late TransactionModule transactionModule;
  ServiceLocator() {
    CommonModule(instance, client: Client());
    accountModule = AccountModule(instance: instance);
    transactionModule = TransactionModule(instance: instance);
  }
  init() async {
    await accountModule.init();
    await transactionModule.init();
  }
}
