import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokedex_challenge/src/core/extensions/extension.dart';

class ColumnDescriptionValue extends StatelessWidget {
  final String description;
  final String value;
  final String? pathIcon;

  const ColumnDescriptionValue({
    Key? key,
    required this.description,
    required this.value,
    this.pathIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 90,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(description, style: context.textTheme.labelLarge!.copyWith(color: context.secondaryTextColor)),
          const SizedBox(height: 8),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              pathIcon != null ? SizedBox(height: 14, child: SvgPicture.asset(pathIcon!)) : const SizedBox.shrink(),
              SizedBox(child: Text(value, style: context.textTheme.labelLarge)),
            ],
          )
        ],
      ),
    );
  }
}
