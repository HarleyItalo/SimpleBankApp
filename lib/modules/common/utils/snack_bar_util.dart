import 'package:flutter/material.dart';

class SnackBarUtil {
  static sendSnackBar(BuildContext context,
      {required title, bool success = true}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .titleSmall
              ?.copyWith(color: Theme.of(context).colorScheme.background),
        ),
        backgroundColor: success
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).colorScheme.error,
        showCloseIcon: true,
        closeIconColor: Theme.of(context).colorScheme.background,
      ),
    );
  }
}
