import 'package:flutter/material.dart';

import 'package:pokedex_challenge/src/core/extensions/extension.dart';

class LabelText extends StatelessWidget {
  final String label;
  final TextAlign? textAlign;

  const LabelText(this.label, {super.key, this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: context.textTheme.labelLarge!.copyWith(color: context.secondaryTextColor),
      textAlign: textAlign,
    );
  }
}
