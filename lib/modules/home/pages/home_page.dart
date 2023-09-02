import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_bank_app/modules/account/stores/account_store.dart';
import 'package:simple_bank_app/modules/home/pages/widgets/access_your_account.dart';
import 'package:simple_bank_app/modules/home/pages/widgets/type_account_number.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool showInput = false;
  final AccountStore accountStore = GetIt.instance.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SimpleBank"),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Theme.of(context).colorScheme.background,
                Theme.of(context).colorScheme.background,
                Theme.of(context).colorScheme.primaryContainer,
                Theme.of(context).colorScheme.primary,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Icon(
                CupertinoIcons.building_2_fill,
                size: 80,
                color: Theme.of(context).colorScheme.primary,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "Welcome to SimpleBank",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              Text(
                "Here all is always simple",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: AnimatedCrossFade(
                  firstChild: AccessYourAccount(
                    callBack: () {
                      setState(() {
                        showInput = true;
                      });
                    },
                  ),
                  secondChild: Observer(builder: (_) {
                    var value = accountStore.accountNumber;
                    return TypeAccountNumber(
                      callBack: () {
                        setState(() {
                          showInput = false;
                        });
                        context.push('/account/$value');
                      },
                      value: value,
                    );
                  }),
                  crossFadeState: !showInput
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                  duration: const Duration(milliseconds: 500),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
