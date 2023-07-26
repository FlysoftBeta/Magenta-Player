import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:magenta_player/utils/element_sizes.dart';

import '../../utils/image_colors.dart';

class PlaylistCard extends HookWidget {
  final ImageProvider image;
  final String title;
  const PlaylistCard({super.key, required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final elementSizes = ElementSizes.of(context);
    final ImageColors colors = useImageColors(image);

    return Container(
        constraints: const BoxConstraints(maxWidth: 600),
        child: Card(
          clipBehavior: Clip.antiAlias,
          color: colors.surface,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: EdgeInsets.all(elementSizes.paddingBig),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ClipPath(
                      clipper: ShapeBorderClipper(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  elementSizes.borderRadiusMedium))),
                      clipBehavior: Clip.antiAlias,
                      child: Image(
                        image: image,
                        height: max(min(120, screenWidth * 0.09), 90),
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      width: elementSizes.paddingMedium,
                    ),
                    Text(
                      title,
                      style: TextStyle(
                          fontSize: elementSizes.fontBig,
                          color: colors.primary,
                          fontWeight: FontWeight.w600,
                          height: 1.2),
                    )
                  ],
                ),
                Ink(
                  decoration: ShapeDecoration(
                    shape: const CircleBorder(),
                    color: colors.primary,
                  ),
                  child: IconButton(
                      iconSize: elementSizes.iconBig,
                      onPressed: () {},
                      color: colors.surface,
                      icon: const Icon(Icons.play_arrow)),
                )
              ],
            ),
          ),
        ));
  }
}

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final elementSizes = ElementSizes.of(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final isWideScreen = screenWidth > 1000;

    return Padding(
        padding: EdgeInsets.all(elementSizes.paddingBig),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: elementSizes.paddingMedium),
                SizedBox(
                    width: double.infinity,
                    child: Text(
                      "为你打造",
                      style: TextStyle(fontSize: elementSizes.fontMedium),
                      textAlign: TextAlign.left,
                    )),
                SizedBox(height: elementSizes.paddingSmall),
                Flex(
                    direction: isWideScreen ? Axis.horizontal : Axis.vertical,
                    children: [
                      const PlaylistCard(
                        image: NetworkImage(
                            "https://p1.music.126.net/Bo2vyBP4MDLK5h9ZRlqm8w==/109951165373523358.jpg?param=512y512"),
                        title: "每日\n推荐",
                      ),
                      const PlaylistCard(
                        image: NetworkImage(
                            "https://p2.music.126.net/njCU7D_y3hRqQQSQmIW1lg==/109951163695044017.jpg?param=224y224"),
                        title: "私人\n电台",
                      )
                    ]
                        .map((e) => isWideScreen ? Flexible(child: e) : e)
                        .toList())
              ],
            )
          ],
        ));
  }
}
