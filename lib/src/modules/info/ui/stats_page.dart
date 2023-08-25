import 'package:flutter/material.dart';
import 'package:pokedex_challenge/src/core/extensions/extension.dart';
import 'package:pokedex_challenge/src/core/helpers/treatment.dart';
import 'package:pokedex_challenge/src/modules/info/domain/view_model/modal_info_view_model.dart';
import 'package:pokedex_challenge/src/modules/info/ui/components/base_page_pagination.dart';
import 'package:pokedex_challenge/src/modules/info/ui/components/label_text.dart';

class StatsPage extends StatelessWidget {
  final ModalInfoViewModel viewModel;
  const StatsPage({
    Key? key,
    required this.viewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasePagePagination(
        child: Column(children: [
      ...viewModel.pokemon.stats
          .map((e) => Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: Row(
                  children: [
                    SizedBox(
                      width: 50,
                      child: LabelText(
                          Treatment.capitalizeFirstLetter(e.name.replaceAll("special-attack", "Sp. Atk").replaceAll("special-defense", "Sp. Def")),
                          textAlign: TextAlign.right),
                    ),
                    const SizedBox(width: 20),
                    LabelText(e.baseStat.round().toString()),
                    const SizedBox(width: 20),
                    e.baseStat < 100
                        ? SizedBox(
                            width: context.w * 0.4,
                            child: LinearProgressIndicator(
                              borderRadius: BorderRadius.circular(5),
                              minHeight: 12,
                              color: e.baseStat < 80 ? context.primaryColor : const Color(0xff0804B4),
                              backgroundColor: context.secondaryBgColor,
                              value: e.baseStat / 100,
                            ),
                          )
                        : const SizedBox.shrink()
                  ],
                ),
              ))
          .toList(),
      Row(
        children: [
          const SizedBox(width: 50, child: LabelText("Total", textAlign: TextAlign.right)),
          const SizedBox(width: 20),
          LabelText(viewModel.pokemon.totalStat.round().toString()),
        ],
      )
    ]));
  }
}
