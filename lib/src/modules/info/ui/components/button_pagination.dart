import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex_challenge/src/core/extensions/extension.dart';
import 'package:pokedex_challenge/src/modules/info/aplication/info_controller.dart';

class ButtonPagination extends StatelessWidget {
  final int index;
  final String label;

  const ButtonPagination({
    Key? key,
    required this.index,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = context.read<InfoController>();
    bool isSelected = controller.pageIsSelected(index);

    return AnimatedBuilder(
        animation: controller,
        builder: (context, __) {
          return GestureDetector(
            onTap: () => controller.goPage(index),
            child: Container(
              decoration: BoxDecoration(
                border: isSelected
                    ? const Border(
                        bottom: BorderSide(color: Colors.red, width: 2),
                      )
                    : null,
              ),
              child: Text(
                label,
                style: context.textTheme.titleMedium!.copyWith(
                  color: isSelected ? context.primaryColor : null,
                ),
              ),
            ),
          );
        });
  }
}
