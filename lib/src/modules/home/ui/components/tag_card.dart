import 'package:flutter/material.dart';

import 'package:pokedex_challenge/src/core/helpers/tag_entity.dart';
import 'package:pokedex_challenge/src/core/helpers/treatment.dart';

class TagCard extends StatelessWidget {
  final TagEntity tag;
  const TagCard({
    Key? key,
    required this.tag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: tag.color, borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              tag.icon,
              color: Colors.white,
              size: 14,
            ),
            const SizedBox(width: 4),
            Text(
              Treatment.capitalizeFirstLetter(tag.name),
              style: const TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
