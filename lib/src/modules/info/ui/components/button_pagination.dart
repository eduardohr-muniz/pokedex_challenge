// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex_challenge/src/core/extensions/extension.dart';
import 'package:pokedex_challenge/src/modules/info/aplication/info_controller.dart';

class ButtonPagination extends StatefulWidget {
  final int index;
  final String label;

  ButtonPagination({
    Key? key,
    required this.index,
    required this.label,
  }) : super(key: key);

  @override
  State<ButtonPagination> createState() => _ButtonPaginationState();
}

class _ButtonPaginationState extends State<ButtonPagination> {
  @override
  Widget build(BuildContext context) {
    final controller = context.read<InfoController>();
    bool isSelected = controller.pageIsSelected(widget.index);

    return GestureDetector(
      onTap: () => controller.goPage(widget.index),
      child: Container(
        decoration: BoxDecoration(
          border: isSelected
              ? Border(
                  bottom: BorderSide(color: context.primaryColor, width: 2),
                )
              : null,
        ),
        child: Text(
          widget.label,
          style: context.textTheme.titleMedium!.copyWith(
            color: isSelected ? context.primaryColor : null,
          ),
        ),
      ),
    );
  }
}
