import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:simple_bank_app/modules/account/stores/account_store.dart';

class TypeAccountNumber extends StatefulWidget {
  final void Function() callBack;
  final String value;
  const TypeAccountNumber({
    super.key,
    required this.callBack,
    required this.value,
  });

  @override
  State<TypeAccountNumber> createState() => _TypeAccountNumberState();
}

class _TypeAccountNumberState extends State<TypeAccountNumber> {
  final AccountStore accountStore = GetIt.instance.get();
  late TextEditingController controller;
  @override
  void initState() {
    controller = TextEditingController(text: widget.value);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            keyboardType: TextInputType.number,
            controller: controller,
            decoration:
                const InputDecoration(hintText: 'Type your account number'),
            onChanged: accountStore.setAccountNumber,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FilledButton(
              onPressed: widget.callBack,
              child: const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text("I'm ready"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
