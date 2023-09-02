import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_bank_app/modules/common/utils/snack_bar_util.dart';
import 'package:simple_bank_app/modules/common/utils/string_util.dart';
import 'package:simple_bank_app/modules/transaction/stores/transaction_store.dart';

class CreateDebitPage extends StatefulWidget {
  final int accountId;
  const CreateDebitPage({super.key, required this.accountId});

  @override
  State<CreateDebitPage> createState() => _CreateDebitPageState();
}

class _CreateDebitPageState extends State<CreateDebitPage> {
  final _formKey = GlobalKey<FormState>();
  MoneyMaskedTextController depositController = MoneyMaskedTextController();
  final TransactionStore transactionsStore = GetIt.instance.get();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Withdraw money'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          if (_formKey.currentState?.validate() == false) return;
          var value = StringUtil.parseStringToDouble(depositController.text);
          var response = await transactionsStore.debit(widget.accountId, value);
          if (!mounted) return;
          SnackBarUtil.sendSnackBar(context,
              title: response.message, success: response.status == 200);
          context.pop();
        },
        backgroundColor: Theme.of(context).colorScheme.error,
        icon: Icon(
          CupertinoIcons.money_dollar_circle,
          color: Theme.of(context).colorScheme.background,
        ),
        label: Text(
          'Withdraw money',
          style: TextStyle(color: Theme.of(context).colorScheme.background),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
          child: Column(
            children: [
              Text(
                "Type value to withdraw money from your account",
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30.0),
                child: TextFormField(
                  controller: depositController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'Value',
                    icon: CircleAvatar(
                      child: Icon(
                        CupertinoIcons.money_dollar,
                      ),
                    ),
                  ),
                  validator: (value) {
                    return StringUtil.parseStringToDouble(value) > 0
                        ? null
                        : "The value must be greater than zero";
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
