import 'package:go_router/go_router.dart';
import 'package:simple_bank_app/modules/account/views/create_account/create_account_page.dart';
import 'package:simple_bank_app/modules/account/views/view_account_info/view_account_info_page.dart';
import 'package:simple_bank_app/modules/home/pages/home_page.dart';
import 'package:simple_bank_app/modules/transaction/views/create_credit/create_credit_page.dart';
import 'package:simple_bank_app/modules/transaction/views/create_debit/create_debit_page.dart';

final routes = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/account/create',
      builder: (context, state) => const CreateAccountPage(),
    ),
    GoRoute(
      path: '/account/:accountId',
      builder: (context, state) => ViewAccountInfo(
        accountId: int.parse(
          state.pathParameters['accountId'] ?? "0",
        ),
      ),
    ),
    GoRoute(
      path: '/transaction/debit/:accountId',
      builder: (context, state) => CreateDebitPage(
        accountId: int.parse(
          state.pathParameters['accountId'] ?? "0",
        ),
      ),
    ),
    GoRoute(
      path: '/transaction/credit/:accountId',
      builder: (context, state) => CreateCreditPage(
        accountId: int.parse(
          state.pathParameters['accountId'] ?? "0",
        ),
      ),
    ),
  ],
);
