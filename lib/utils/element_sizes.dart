import 'package:flutter/material.dart';

class ElementSizes extends InheritedWidget {
  const ElementSizes(
      {super.key,
      required super.child,
      required this.fontBig,
      required this.fontMedium,
      required this.iconBig,
      required this.iconMedium,
      required this.paddingBig,
      required this.paddingMedium,
      required this.paddingSmall,
      required this.borderRadiusBig,
      required this.borderRadiusMedium});

  final double fontBig;
  final double fontMedium;
  final double iconBig;
  final double iconMedium;
  final double paddingBig;
  final double paddingMedium;
  final double paddingSmall;
  final double borderRadiusBig;
  final double borderRadiusMedium;

  static ElementSizes? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ElementSizes>();
  }

  static ElementSizes of(BuildContext context) {
    final ElementSizes? result = maybeOf(context);
    return result!;
  }

  @override
  bool updateShouldNotify(ElementSizes oldWidget) =>
      fontBig != oldWidget.fontBig ||
      fontMedium != oldWidget.fontMedium ||
      iconBig != oldWidget.iconBig ||
      iconMedium != oldWidget.iconMedium ||
      paddingBig != oldWidget.paddingBig ||
      paddingMedium != oldWidget.paddingMedium ||
      paddingSmall != oldWidget.paddingSmall ||
      borderRadiusBig != oldWidget.borderRadiusBig ||
      borderRadiusMedium != oldWidget.borderRadiusMedium;
}
