import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../pods/pods.dart';
import '../../utils/app.dart';

/// The ColorPicker shown in a card on the ColorPickerScreen.
@immutable
class ColorPickerCard extends ConsumerWidget {
  const ColorPickerCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeData theme = Theme.of(context);
    return Card(
      elevation: 1,
      child: ColorPicker(
        color: ref.watch(cardPickerColorPod),
        onColorChangeStart: (Color color) {
          ref.read(onColorChangeStartPod.notifier).state = color;
        },
        onColorChanged: (Color color) {
          ref.read(cardPickerColorPod.notifier).state = color;
          ref.read(onColorChangedPod.notifier).state = color;
        },
        onColorChangeEnd: (Color color) {
          ref.read(onColorChangeEndPod.notifier).state = color;
        },
        onRecentColorsChanged: (List<Color> colors) {
          ref.read(cardRecentColorsPod.notifier).state = colors;
        },
        crossAxisAlignment: ref.watch(alignmentPod),
        padding: EdgeInsets.all(ref.watch(paddingPod)),
        enableShadesSelection: ref.watch(enableShadesSelectionPod),
        includeIndex850: ref.watch(includeIndex850Pod),
        enableTonalPalette: ref.watch(enableTonesSelectionPod),
        tonalPaletteFixedMinChroma: ref.watch(tonalPaletteFixedMinChromaPod),
        enableOpacity: ref.watch(enableOpacityPod),
        opacityTrackHeight: ref.watch(opacityTrackHeightPod),
        opacityTrackWidth: ref.watch(opacityTrackWidthPod),
        opacityThumbRadius: ref.watch(opacityThumbRadiusPod),
        copyPasteBehavior: ColorPickerCopyPasteBehavior(
          ctrlC: ref.watch(ctrlCPod),
          ctrlV: ref.watch(ctrlVPod),
          autoFocus: ref.watch(autoFocusPod),
          copyButton: ref.watch(copyButtonPod),
          pasteButton: ref.watch(pasteButtonPod),
          copyFormat: ref.watch(copyFormatPod),
          longPressMenu: ref.watch(longPressMenuPod),
          secondaryMenu: ref.watch(secondaryMenuPod),
          secondaryOnDesktopLongOnDevice:
              ref.watch(secondaryDesktopOtherLongPod),
          secondaryOnDesktopLongOnDeviceAndWeb:
              ref.watch(secondaryDesktopWebLongPod),
          editFieldCopyButton: ref.watch(editFieldCopyButtonPod),
          parseShortHexCode: ref.watch(parseShortHexCodePod),
          editUsesParsedPaste: ref.watch(editUsesParsedPastePod),
          snackBarParseError: ref.watch(snackbarParseErrorPod),
          feedbackParseError: ref.watch(feedbackParseErrorPod),
        ),
        width: ref.watch(sizePod),
        height: ref.watch(sizePod),
        tonalColorSameSize: ref.watch(tonalSameSizePod),
        spacing: ref.watch(spacingPod),
        runSpacing: ref.watch(runSpacingPod),
        elevation: ref.watch(elevationPod),
        hasBorder: ref.watch(hasBorderPod),
        borderRadius: ref.watch(borderRadiusPod),
        columnSpacing: ref.watch(columnSpacingPod),
        toolbarSpacing: 0,
        wheelDiameter: ref.watch(wheelDiameterPod),
        wheelWidth: ref.watch(wheelWidthPod),
        wheelSquarePadding: ref.watch(wheelSquarePaddingPod),
        wheelSquareBorderRadius: ref.watch(wheelSquareBorderRadiusPod),
        wheelHasBorder: ref.watch(wheelHasBorderPod),
        enableTooltips: ref.watch(enableTooltipsPod),
        pickersEnabled: ref.watch(pickersEnabledPod),
        pickerTypeLabels: const <ColorPickerType, String>{
          ColorPickerType.both: 'P & A',
          ColorPickerType.bw: 'B & W',
        },
        selectedPickerTypeColor: theme.colorScheme.primary,
        title: ref.watch(showTitlePod)
            ? Text(
                'ColorPicker',
                style: theme.textTheme.titleLarge,
              )
            : null,
        heading: ref.watch(showHeadingPod)
            ? Text(
                'Select color',
                style: theme.textTheme.headlineSmall,
              )
            : null,
        subheading: ref.watch(showSubheadingPod)
            ? Text(
                'Select color shade',
                style: theme.textTheme.titleMedium,
              )
            : null,
        tonalSubheading: ref.watch(showTonalSubheadingPod)
            ? Text(
                'Material 3 tonal palette',
                style: theme.textTheme.titleMedium,
              )
            : null,
        wheelSubheading: ref.watch(showSubheadingPod)
            ? Text(
                'Selected color and its color swatch',
                style: theme.textTheme.titleMedium,
              )
            : null,
        opacitySubheading: ref.watch(showOpacitySubheadingPod)
            ? Text(
                'Opacity',
                style: theme.textTheme.titleMedium,
              )
            : null,
        recentColorsSubheading: ref.watch(showRecentSubheadingPod)
            ? Text(
                'Recent colors',
                style: theme.textTheme.titleMedium,
              )
            : null,
        showMaterialName: ref.watch(showMaterialNamePod),
        showColorName: ref.watch(showColorNamePod),
        showColorCode: ref.watch(showColorCodePod),
        showEditIconButton: ref.watch(showEditIconButtonPod),
        colorCodeHasColor: ref.watch(colorCodeHasColorPod),
        focusedEditHasNoColor: ref.watch(focusedEditHasNoColorPod),
        colorCodeReadOnly: ref.watch(colorCodeReadOnlyPod),
        showColorValue: ref.watch(showColorValuePod),
        showRecentColors: ref.watch(showRecentColorsPod),
        recentColors: ref.watch(cardRecentColorsPod),
        maxRecentColors: 8,
        customColorSwatchesAndNames: App.colorsNameMap,
        customSecondaryColorSwatchesAndNames: App.colorsOptionsMap,
        colorCodeTextStyle: theme.textTheme.titleMedium,
        colorCodePrefixStyle: theme.textTheme.bodySmall,
      ),
    );
  }
}
