import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_bank_app/modules/account/views/view_account_info/widgets/transactions_list.dart';
import 'package:simple_bank_app/modules/common/utils/string_util.dart';

import '../../../common/common_module.dart';
import '../../../transaction/stores/transaction_store.dart';
import '../../account_module.dart';

class ViewAccountInfo extends StatefulWidget {
  final int accountId;
  const ViewAccountInfo({super.key, required this.accountId});

  @override
  State<ViewAccountInfo> createState() => _ViewAccountInfoState();
}

class _ViewAccountInfoState extends State<ViewAccountInfo> {
  final AccountStore accountStore = GetIt.instance.get();
  final TransactionStore transactionsStore = GetIt.instance.get();
  @override
  void initState() {
    init();
    super.initState();
  }

  init() async {
    await Future.wait(
      [
        accountStore.getAccount(widget.accountId),
        transactionsStore.getBalance(widget.accountId),
        transactionsStore.getTransactions(widget.accountId),
      ],
    );
    if (accountStore.account != null) {
      return;
    }
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text("Account not found. check your account number"),
      showCloseIcon: true,
      backgroundColor: Theme.of(context).colorScheme.error,
    ));
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(),
          SliverToBoxAdapter(
            child: Observer(
              builder: (_) {
                var account = accountStore.account;
                var balance = transactionsStore.balance;
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(20),
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Theme.of(context)
                                    .colorScheme
                                    .primaryContainer),
                            child: Icon(
                              CupertinoIcons.person,
                              size: 50,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Hello, ${account?.name ?? ''} ${account?.lastName ?? ''}",
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              Text(
                                "Your Balance is: ${StringUtil.formatCurrency(balance)}",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          TransactionsList(transactionsStore: transactionsStore)
        ],
      ),
    );
  }
}
