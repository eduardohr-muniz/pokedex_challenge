import 'package:flutter/material.dart';

import 'package:pokedex_challenge/src/core/extensions/extension.dart';
import 'package:pokedex_challenge/src/core/helpers/assets.dart';
import 'package:pokedex_challenge/src/core/helpers/treatment.dart';
import 'package:pokedex_challenge/src/modules/home/ui/components/tag_card.dart';
import 'package:pokedex_challenge/src/modules/info/ui/components/base_page_pagination.dart';
import 'package:pokedex_challenge/src/modules/info/ui/components/column_description_value.dart';

import '../domain/view_model/modal_info_view_model.dart';

class AboutPage extends StatelessWidget {
  final ModalInfoViewModel viewModel;
  const AboutPage({
    Key? key,
    required this.viewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasePagePagination(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ColumnDescriptionValue(description: "Height", value: "${viewModel.pokemon.height}m", pathIcon: Assets.iconHeight),
              ColumnDescriptionValue(description: "Weight", value: "${viewModel.pokemon.weight}kg", pathIcon: Assets.iconWeight),
              ColumnDescriptionValue(description: "Gender", value: "${viewModel.pokemon.baseExperience}m", pathIcon: Assets.iconGender),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ColumnDescriptionValue(description: "Category", value: Treatment.capitalizeFirstLetter(viewModel.tags.first.name.toString())),
              ColumnDescriptionValue(description: "Abilities", value: viewModel.pokemon.abilities.first.name),
              const ColumnDescriptionValue(description: "", value: ""),
            ],
          ),
          const SizedBox(height: 24),
          Text("Weakenes", style: context.textTheme.labelLarge!.copyWith(color: context.secondaryTextColor)),
          const SizedBox(height: 16),
          SizedBox(
            child: Wrap(
              spacing: 4,
              runSpacing: 4,
              children: viewModel.tags.map((tag) => TagCard(tag: tag)).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
