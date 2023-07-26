import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:palette_generator/palette_generator.dart';

class ImageColors {
  final Color primary;
  final Color secondary;
  final Color surface;
  final Color background;
  const ImageColors(
      {required this.primary,
      required this.secondary,
      required this.surface,
      required this.background});
}

ImageColors useImageColors(ImageProvider provider) {
  final curColor = Theme.of(useContext()).colorScheme;
  final result = useFuture<ImageColors>(
      PaletteGenerator.fromImageProvider(provider,
              maximumColorCount: 20, timeout: Duration.zero)
          .then((value) {
        return ImageColors(
            primary: value.darkVibrantColor!.color,
            secondary: value.lightVibrantColor!.color,
            surface: value.lightMutedColor!.color,
            background: value.darkMutedColor!.color);
      }),
      initialData: ImageColors(
          primary: curColor.primary,
          secondary: curColor.secondary,
          surface: curColor.surfaceVariant,
          background: curColor.background));
  return result.requireData;
}
