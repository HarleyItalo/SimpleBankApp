import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:simple_bank_app/modules/account/stores/account_store.dart';
import 'package:simple_bank_app/modules/common/utils/string_util.dart';
import 'package:simple_bank_app/modules/transaction/stores/transaction_store.dart';

class Profile extends StatelessWidget {
  const Profile({
    super.key,
    required this.accountStore,
    required this.transactionsStore,
  });

  final AccountStore accountStore;
  final TransactionStore transactionsStore;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
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
                          color:
                              Theme.of(context).colorScheme.primaryContainer),
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
                                  color: Theme.of(context).colorScheme.primary),
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
    );
  }
}
