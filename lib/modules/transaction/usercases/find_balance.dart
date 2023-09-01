import '../transaction_module.dart';

abstract class FindBalance {
  Future<BalanceModel> call({
    required int accountId,
  });
}
