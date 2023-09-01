import 'package:http/http.dart' as http;

import 'common_module.dart';
export 'package:simple_bank_app/modules/base_module.dart';
export 'package:simple_bank_app/modules/common/services/http_service.dart';
export 'package:simple_bank_app/modules/common/constants/constants.dart';
export 'package:simple_bank_app/modules/common/models/base_response.dart';

class CommonModule extends BaseModule {
  final http.Client client;
  CommonModule(
    instance, {
    required this.client,
  }) : super(instance: instance);

  @override
  Future init() async {}

  @override
  Future injectModule() async {
    instance.registerLazySingletonAsync(
      () async => HttpService(client: client),
    );
  }
}
