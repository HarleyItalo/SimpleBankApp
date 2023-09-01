import 'package:simple_bank_app/modules/common/models/base_response.dart';

abstract class CreateDebitTransaction {
  Future<BaseResponseModel> call({
    required int accountId,
    required double value,
  });
}
