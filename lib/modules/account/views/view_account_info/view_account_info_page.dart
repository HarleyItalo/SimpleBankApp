import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_bank_app/modules/account/views/view_account_info/widgets/profile.dart';
import 'package:simple_bank_app/modules/account/views/view_account_info/widgets/transactions_list.dart';
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
          Profile(
              accountStore: accountStore, transactionsStore: transactionsStore),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FilledButton.icon(
                    onPressed: () {
                      context.push('/transaction/credit/${widget.accountId}');
                    },
                    icon: const Icon(CupertinoIcons.add),
                    label: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 20.0),
                      child: Text('Deposit'),
                    ),
                  ),
                  FilledButton.icon(
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                            Theme.of(context).colorScheme.error)),
                    onPressed: () {
                      context.push('/transaction/debit/${widget.accountId}');
                    },
                    icon: const Icon(CupertinoIcons.minus),
                    label: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 20.0),
                      child: Text('Debit'),
                    ),
                  )
                ],
              ),
            ),
          ),
          TransactionsList(transactionsStore: transactionsStore)
        ],
      ),
    );
  }
}
