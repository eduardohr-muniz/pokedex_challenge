import 'package:flutter/material.dart';

import 'package:pokedex_challenge/src/core/extensions/extension.dart';

class BasePagePagination extends StatelessWidget {
  final Widget child;
  const BasePagePagination({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        color: context.secondaryBgColor,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(40),
            child: child,
          ),
        ),
      ),
    );
  }
}
