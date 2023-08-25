import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokedex_challenge/src/core/extensions/extension.dart';
import 'package:pokedex_challenge/src/modules/info/aplication/info_controller.dart';

import 'package:pokedex_challenge/src/modules/info/domain/view_model/modal_info_view_model.dart';
import 'package:pokedex_challenge/src/modules/info/ui/components/button_pagination.dart';

import '../../../../core/helpers/pokeicon_icons.dart';
import '../../../../core/helpers/treatment.dart';
import '../../../home/ui/components/tag_card.dart';

class DiagonalContainer extends StatelessWidget {
  final ModalInfoViewModel viewModel;
  const DiagonalContainer({
    Key? key,
    required this.viewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = context.read<InfoController>();
    return Stack(
      children: [
        Column(
          children: [
            ClipPath(
              clipper: MyClipper(),
              child: Container(
                color: Colors.white,
                child: Container(
                  height: context.w / 1.8,
                  width: context.w,
                  decoration: BoxDecoration(
                    color: viewModel.tags.first.color,
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        viewModel.tags.first.color,
                        viewModel.tags.first.colorCard,
                      ],
                    ),
                  ),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: SizedBox(
                          width: 140,
                          child: ImageFiltered(
                            imageFilter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                            child: SvgPicture.asset(
                              "assets/images/pokeball.svg",
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "#${Treatment.formathashDoubleNumber(viewModel.id)}",
                                  style: context.textTheme.bodyMedium!.copyWith(color: Colors.white),
                                ),
                                Text(
                                  Treatment.capitalizeFirstLetter(viewModel.name),
                                  style: context.textTheme.displaySmall!.copyWith(color: Colors.white),
                                ),
                                const SizedBox(height: 15),
                                SizedBox(
                                  child: Wrap(
                                    spacing: 4,
                                    runSpacing: 4,
                                    children: viewModel.tags.map((tag) => TagCard(tag: tag)).toList(),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.white,
              width: context.w,
              height: 70,
              child: AnimatedBuilder(
                  animation: controller,
                  builder: (context, _) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ButtonPagination(index: 0, label: "About"),
                        ButtonPagination(index: 1, label: "Stats"),
                        ButtonPagination(index: 2, label: "Evolution"),
                        ButtonPagination(index: 3, label: "Moves"),
                      ],
                    );
                  }),
            )
          ],
        ),
        const Padding(
          padding: EdgeInsets.only(top: 30, right: 20),
          child: Align(alignment: Alignment.topRight, child: Icon(Pokeicon.heart, size: 35)),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 40, right: 25),
          child: SizedBox(
            width: context.w * 0.5,
            child: CachedNetworkImage(
              imageUrl: viewModel.urlImage,
              fit: BoxFit.fill,
              progressIndicatorBuilder: (context, url, downloadProgress) => CircularProgressIndicator(value: downloadProgress.progress),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
        ),
      ],
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    const double radius = 20.0;
    path.lineTo(0, 70 + radius);
    path.quadraticBezierTo(0, 75, radius, 70);
    path.lineTo(size.width - radius, 4);
    path.quadraticBezierTo(size.width, 0, size.width, 0 + radius);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
