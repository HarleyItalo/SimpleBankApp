import 'package:go_router/go_router.dart';
import 'package:simple_bank_app/modules/home/pages/home_page.dart';

final routes = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
  ],
);
