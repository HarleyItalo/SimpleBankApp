import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_bank_app/modules/account/account_module.dart';
import 'package:simple_bank_app/modules/common/utils/snack_bar_util.dart';
import 'package:simple_bank_app/modules/common/utils/string_util.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  MoneyMaskedTextController depositController = MoneyMaskedTextController();
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  final AccountStore accountStore = GetIt.instance.get();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create your account"),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          if (_formKey.currentState?.validate() == false) return;
          var accountModel = CreateAccountModel(
            name: nameController.text,
            lastName: surnameController.text,
            initialBalance:
                StringUtil.parseStringToDouble(depositController.text),
          );
          var response = await accountStore.createAccount(accountModel);
          if (!mounted) return;
          SnackBarUtil.sendSnackBar(
            context,
            title: response.message,
            success: response.status == 200,
          );
          if (response.account?.accoutId != null) {
            var accountId = response.account!.accoutId;
            context.push("/account/$accountId");
          }
        },
        icon: const Icon(CupertinoIcons.rocket),
        label: const Text('Create your account'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Text(
                  "Type your information to create your account",
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: TextFormField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      hintText: 'Type your name',
                    ),
                    validator: (value) {
                      if (StringUtil.isNullOrEmpty(value)) {
                        return "You must provide your name";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: TextFormField(
                    controller: surnameController,
                    decoration: const InputDecoration(
                      hintText: 'Type your surname',
                    ),
                    validator: (value) {
                      if (StringUtil.isNullOrEmpty(value)) {
                        return "You must provide your surname";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: TextFormField(
                    controller: depositController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        hintText: 'Type your initial deposit'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
