import 'package:flutter/material.dart';
import 'package:pokedex_challenge/src/core/helpers/tag_entity.dart';
import 'package:pokedex_challenge/src/core/helpers/treatment.dart';
import 'package:pokedex_challenge/src/modules/home/ui/components/diagonal_container.dart';
import 'package:pokedex_challenge/src/modules/home/ui/components/tag_card.dart';
import '../../core/interfaces/messages/messages.dart';

class TestePage extends StatelessWidget {
  const TestePage({super.key});

  @override
  Widget build(BuildContext context) {
    final Messages message = Messages(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Center(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text("Tags"),
                Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: TagEntity.tags
                        .map((tag) => Container(
                              decoration: BoxDecoration(color: tag.color, shape: BoxShape.circle),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Icon(
                                  tag.icon,
                                  color: Colors.white,
                                  size: 14,
                                ),
                              ),
                            ))
                        .toList()),
                const SizedBox(height: 20),
                Text("Tags card"),
                Wrap(spacing: 10, runSpacing: 10, children: TagEntity.tags.map((tag) => TagCard(tag: tag)).toList()),
                Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: TagEntity.tags
                        .map((tag) => ClipPath(
                              clipper: MyClipper(),
                              child: Container(
                                color: Colors.white,
                                child: Container(
                                  height: MediaQuery.sizeOf(context).width * 0.99 / 1.8,
                                  width: MediaQuery.sizeOf(context).width * 0.99,
                                  decoration: BoxDecoration(
                                    color: tag.color,
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        tag.color.withGreen(70).withOpacity(0.9),
                                        tag.color.withOpacity(0.8),
                                      ],
                                    ),
                                  ),
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
                                        SizedBox(width: 4),
                                        Text(
                                          Treatment.capitalizeFirstLetter(tag.name),
                                          style: TextStyle(color: Colors.white),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ))
                        .toList()),
              ],
            ),
          )),
        ),
      ),
    );
  }
}
