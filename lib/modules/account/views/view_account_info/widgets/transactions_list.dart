import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:simple_bank_app/modules/account/views/view_account_info/widgets/empty.dart';
import 'package:simple_bank_app/modules/common/utils/string_util.dart';
import 'package:simple_bank_app/modules/transaction/stores/transaction_store.dart';

class TransactionsList extends StatelessWidget {
  const TransactionsList({
    super.key,
    required this.transactionsStore,
  });

  final TransactionStore transactionsStore;

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      var transactions = transactionsStore.transactions;
      if (transactions.isEmpty) {
        return const Empty(
            title: "You don't have any transaction",
            icon: CupertinoIcons.exclamationmark_circle);
      }
      return SliverPadding(
        padding: const EdgeInsets.all(10.0),
        sliver: SliverList.builder(
          itemCount: transactions.length,
          itemBuilder: (_, index) {
            var transaction = transactions[index];
            return Card(
              margin: const EdgeInsets.all(10),
              child: ListTile(
                contentPadding: const EdgeInsets.all(5),
                leading: CircleAvatar(
                  child: Icon(transaction.transactionType == "credit"
                      ? CupertinoIcons.add
                      : CupertinoIcons.minus),
                ),
                title: Text(
                  StringUtil.formatCurrency(transaction.value),
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                subtitle: Text(StringUtil.formatData(transaction.createdAt)),
              ),
            );
          },
        ),
      );
    });
  }
}
