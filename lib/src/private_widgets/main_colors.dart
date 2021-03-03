import 'package:flutter/material.dart';

import '../../flex_color_picker.dart';
import '../functions/picker_functions.dart';

/// MainColors widget.
///
/// Not library exposed, private to the library.
class MainColors extends StatelessWidget {
  /// Default const constructor.
  const MainColors({
    Key? key,
    required this.spacing,
    required this.runSpacing,
    required this.columnSpacing,
    required this.activeColorSwatchList,
    required this.selectedColor,
    required this.onSelectColor,
    required this.includeIndex850,
    required this.width,
    required this.height,
    this.borderRadius,
    required this.hasBorder,
    this.borderColor,
    required this.elevation,
    required this.selectedColorIcon,
  }) : super(key: key);

  /// The spacing between the color pick items.
  final double spacing;

  /// The run spacing between the color pick items when wrapped on several rows.
  final double runSpacing;

  /// The spacing after the main colors.
  final double columnSpacing;

  /// The currently active used list of color swatches we select color from.
  final List<ColorSwatch<Object>> activeColorSwatchList;

  /// The selected color.
  final Color selectedColor;

  /// Void callback called when a color is selected.
  final ValueChanged<Color> onSelectColor;

  /// Set to trued if index 850 is to be included in the main shades.
  final bool includeIndex850;

  /// Width of the color pick item.
  final double width;

  /// Height of the color pick item.
  final double height;

  /// Border radius of the color pick item.
  final double? borderRadius;

  /// Set to true if pick item should have a border.
  final bool hasBorder;

  /// Color of the border when one is used.
  final Color? borderColor;

  /// Material elevation of the color pick item.
  final double elevation;

  /// Icon used to mark selected color.
  final IconData selectedColorIcon;

  @override
  Widget build(BuildContext context) {
    final double _borderRadius = borderRadius ?? width / 4.0;
    return Padding(
      padding: EdgeInsets.only(bottom: columnSpacing),
      child: Wrap(
        spacing: spacing,
        runSpacing: runSpacing,
        children: <Widget>[
          for (final ColorSwatch<Object> colorSwatch in activeColorSwatchList)
            ColorIndicator(
              isSelected: isShadeOfMain(
                colorSwatch,
                selectedColor,
                includeIndex850,
              ),
              color: colorSwatch,
              width: width,
              height: height,
              borderRadius: _borderRadius,
              hasBorder: hasBorder,
              borderColor: borderColor,
              elevation: elevation,
              selectedIcon: selectedColorIcon,
              onSelect: () {
                onSelectColor(colorSwatch[500] ?? colorSwatch[200]!);
              },
            ),
        ],
      ),
    );
  }
}
