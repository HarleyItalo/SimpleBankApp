import 'package:get_it/get_it.dart';

abstract class BaseModule {
  late GetIt instance;
  BaseModule({
    required this.instance,
  }) {
    injectModule();
  }
  Future injectModule();
  Future init();
}
