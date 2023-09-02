import 'package:flutter/material.dart';

class Empty extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool sliver;
  const Empty(
      {Key? key, required this.title, required this.icon, this.sliver = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return !sliver
        ? content(
            context,
          )
        : SliverToBoxAdapter(
            child: content(context),
          );
  }

  Widget content(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        elevation: 0.5,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 50,
                color: Theme.of(context).colorScheme.primary,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
