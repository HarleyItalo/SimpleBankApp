import 'package:simple_bank_app/modules/common/models/base_response.dart';

abstract class CreateCreditTransaction {
  Future<BaseResponseModel> call({
    required int accountId,
    required String name,
    required String lastName,
  });
}
