import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AccessYourAccount extends StatelessWidget {
  final void Function() callBack;
  const AccessYourAccount({
    super.key,
    required this.callBack,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20.0, bottom: 10),
          child: Text(
            "Do you have an account? If not, create one now!",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        FilledButton(
          onPressed: () {
            context.push('/account/create');
          },
          child: const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              "Create your account",
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(20.0),
          child: Text(
            "Acess you account",
            textAlign: TextAlign.center,
          ),
        ),
        OutlinedButton(
          onPressed: callBack,
          child: const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text("Access your account"),
          ),
        ),
      ],
    );
  }
}
