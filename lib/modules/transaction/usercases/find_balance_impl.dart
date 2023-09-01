import 'package:simple_bank_app/modules/transaction/models/balance_model.dart';

abstract class FindBalance {
  Future<BalanceModel> call({
    required int accountId,
  });
}
