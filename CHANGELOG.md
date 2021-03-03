# Changelog

All notable changes to the **FlexColorPicker** package will be documented in this file.

## [2.0.0-nullsafety.1] - February 3, 2021
There are many new features included in this version 2 pre-release. The new features can be explored with [live Web example](https://rydmike.com/democolorpicker/). Its source code is also included in the package example folder, in "example/lib/demo/main.dart".

* Improvements: The wheel picker now move on pointer down to point location, it no longer requires a slight movement
  for its thumbs to move to the selected start tracking point.
* Improvements: Keyboard traversal of the colors and selecting indicator colors with the keyboard via
  enter or space. The wheel can however still not be operated with a keyboard, only touch and mouse controlled. 
* New property `onColorChangeStart`: Called when user starts color selection with current color before the change.
* New property `onColorChangeEnd`: Called when user ends color selection with the new color value. 
* New property `selectedPickerTypeColor`: The color of the thumb on the slider that shows the selected picker.
  Ported from none null-safe version 1.1.4, does not exist in version 2.0.0-nullsafety.0.
* New property `colorCodePrefixStyle`: Defines the text style of the prefix for the color code.
  If not defined it defaults to same style as `colorCodeTextStyle`.
  Ported from none null-safe version 1.1.4, does not exist in version 2.0.0-nullsafety.0.
* New property `title`: A Widget used as an app bar type of title widget above the heading. Can
  include copy, paste, select-close and cancel-cancel icon buttons when picker is used as a dialog.
* **Major new feature**: An `actionButtons` property that takes an `ColorPickerActionButtons()`. Used to define 
  what type of **Ok** and **Cancel** action buttons the color picker has when used in a dialog. 
  It is possible to define if
  bottom action buttons should be `TextButton`, `OutlinedButton` or `ElevatedButton` per button.
  If not defined, the labels on the buttons come from Material localizations, not from default hard coded values. 
  See breaking label for the 'Select' label. There are optional select/OK and cancel icon buttons that can be used 
  in the title bar for a more compact dialog. *See API documentation for more information.*
* **Major feature**: A `copyPasteBehavior` property that takes an `ColorPickerCopyPasteBehavior()`. 
  Used to define the copy/paste behavior of the color picker, including: 
    * Keyboard shortcuts: CTRL-C, CMD-C, CTRL-V, CMD-V
    * Top toolbar copy-paste buttons.
    * Long press copy-paste menu. 
  
  All copy/paste behaviours are optional and can be enabled based on what is needed.
  
  For the copy format, the desired resulting RGB color string format can be configured to use #RRGGBB 
  RRGGBB #AARRGGBB AARRGGBB and 0xAARRGGBB (default) options. The selected copy format is indicated with the 
  corresponding prefix in the color code display/edit field when it is enabled.

  Paste supports parsing multiple RGB color string formats. It automatically detects what format is used and auto
  parses to correct Flutter/Dart color value. You can e.g. paste string formatted as #RRGGBB RRGGBB #AARRGGBB
  AARRGGBB #RGB RGB or 0xAARRGGBB, partial color string values also work. You can also activate
  a snack bar that informs the users if they paste color strings in an unsupported RGB string format into the
  color picker.

  *See API documentation for more information.*

* **Major new feature**: The picker can display recently used colors in a list of color indicators at the bottom of 
  the picker. You can use the following properties to control it.
    * `showRecentColors`: Set to true/false to enable/disable the usage of the recent colors feature.
    * `recentColorsSubheading`: Subheading widget for the recently used colors. Typically, a Text widget, 
      e.g. Text('Recent colors'). If not provided there is no sub heading for the recently used colors.
    * `maxRecentColors`: Number of recent colors to track, from 2 to 20 allowed.
    * `recentColors`: a list with current recent color, defaults to empty. You can store the last list
      and use it to restore the previous recent colors list.
    * `onRecentColorsChanged`: Optional value callback that returns a copy the current list of recently 
      used colors. Use it store a copy of the recent colors in order to be able to restore it later.
      
      *See API documentation for more information.*

### Breaking changes

The following are minor breaking changes from version 1.x, they mostly concern visual nuances and label defaults.
* The `colorCodeIcon` has been deprecated and no longer has any function. To modify the copy icon on the color 
  code entry field, define the `ColorPickerCopyPasteBehavior(copyIcon: myIcon)` and provide it to the
  `copyPasteBehavior` property, it defaults to same icon as in version 1.x. 
* The bottom action button that selects the color now says **OK** instead of **Select**. The label for the OK 
  button by default comes from a Material localization. You can as before change it to whatever string you want.
* The dialog bottom action button for **OK** by default now uses just a plain `TextButton` and 
  not an `OutlinedButton`, this change is done to conform to a less opinionated default style. You can still
  manually configure it to use an `OutlinedButton` instead as before. Now you can choose, before there was 
  no choice.
* The dialog bottom **OK** button is no longer auto-focused. 

  
## [2.0.0-nullsafety.0] - February 15, 2021
* First version with null safety.
* A workaround to https://github.com/flutter/flutter/issues/71687 was introduced. The issue has not been resolved.
  However, the workaround allows for the Wrap implementation that was changed to a Row in version 1.1.2, to be used
  again.
* The almost full API configurable Web example and demo, was included in the package in "example/lib/demo/mina.dart" together
  with the previous default example in "example/lib/main.dart". Previously this Web example was in a separate GitHub
  repository. The example was updated to make it responsive, to offer better usability on Web.


## [1.1.5] - March 3, 2021
* Bug fix `selectedPickerTypeColor`: When color was undefined, the thumb did not receive the same text color as the
  default and only one before in version 1.1.3 and earlier, in dark-mode. This broke compatibility with past style
  when using dark-mode. This fix restores the correct past style when the `selectedPickerTypeColor` is undefined.
  
## [1.1.4] - March 3, 2021
* New property `selectedPickerTypeColor`: Defines the color of the thumb on the slider that shows the selected picker.
* New property `colorCodePrefixStyle`: Defines the text style of the prefix for the color code.
  If not defined it defaults to same style as `colorCodeTextStyle`.
  
## [1.1.3] - December 22, 2020
* Fixed the faulty documentation and comment for showPickerDialog parameter insetPadding.
* Fixed the faulty default value for showPickerDialog parameter insetPadding, the new default
  value is the same as Flutter and Material default
  `EdgeInsets.symmetric(horizontal: 40.0, vertical: 24.0)`, as it should have been.
* Minor documentation style correction.

## [1.1.2] - December 5, 2020
* Temporary: The Wrap implementation for showing the color code and integer value was changed to a Row due to a regression in Flutter SDK causing a crash issue on channels dev and master when showing the ColorPicker in a Dialog. For more info see here: https://github.com/flutter/flutter/issues/71687
When the issue is resolved, the implementation will be reverted to Wrap again. Using a Wrap has the added benefit of breaking the color code display+input field, and the rarely used int value, into two rows in case a large font is used in a narrow view when they are both configured to be shown. The Row may overflow in some rare cases. If you do not plan to use the ColorPicker with channels and versions affected by the issue, you can still use the previous version 1.1.1 to keep using the Wrap implementation if you need it. With normal styling it is typically not needed.
* Fixed that the provided `TextStyle` via property `colorCodeTextStyle` was not also applied to the shown color integer value when `showColorValue` was set to `true`, as stated in API doc and intended.

## [1.1.1] - November 11, 2020
* Updated the example app and documentation. The update includes updated screenshots and updated animated gifs.
* Unit tests for ColorTools added, widget tests still pending for later updates.

## [1.1.0] - November 6, 2020
* New API: Added `showColorValue` to optionally display the int value of the selected color. This can be used to assist developers when they need to see or copy selected color values as int numbers.
* New APIs: Exposed previously missing static color names in the API for all the accent and B&W color names in `ColorTools`. All the color name values default to English color names, but can now be changed to translated strings to provide Material color names in other languages as well.
* Updated the live Web demo to demonstrate the `showColorValue` property.
* Example and documentation updated.

## [1.0.0] - November 5, 2020
* First official release.
* Example and documentation updated.
* Updated the live Web demo version to use the released package.
* New API: Added `shouldUpdate` to the color wheel picker, as a fix for an issue where black selection changed hue to red. This is a lower level API that is not needed unless you make your own picker from scratch, and you want to use the wheel picker in your own picker.
* Final API name tweaks before version 1.0.0 release:
* Renamed: API `createPrimaryColor` -> `createPrimarySwatch`
* Renamed: API `createAccentColor` -> `createAccentSwatch`
* Renamed: API `colorNameAndHexCode` -> `materialNameAndCode`
* Renamed: API `colorName` -> `materialName`
* Renamed: API `colorHexCode` -> `colorCode`

## [1.0.0-dev.5] - November 5, 2020

* Added a feature on the wheel color picker that enables entry of a hex RGB value to select a color.
* API changes to support separate display of Material color name `showMaterialName` and selected color code `showColorCode`, plus defining their text styles `materialNameTextStyle` and `colorCodeTextStyle`.
* New API `showColorName` to display an English color name for any selected color, not just the Material color names or custom named color swatches. It has text style that can be defined as well `colorNameTextStyle`.
* New API `colorCodeIcon` that exposes the color code copy icon, so it can be customized.
* New API `enableTooltips` to enable current and future tooltips used in the picker. Currently, only the copy color code button has a tooltip.
* A new method introduced in ColorTools called `nameThatColor(Color color)`. It returns a name for any color passed to it. Only supports English names. Based on a Dart port of http://chir.ag/projects/ntc, it contains 1566 colors and their names. It matches the given color to the closest similar color in the list and returns its name.
* Example and documentation updated.

## [1.0.0-dev.4] - November 2, 2020

* Update to try to get the images to show up on pub.dev.
* Minor documentation corrections.

## [1.0.0-dev.3] - November 2, 2020

* Significant API name changes and cleanup. Decided to implement previously planned changes before the official release, even if it will also impact our own usage of the package when we move to using the published version.

## [1.0.0-dev.2] - October 30, 2020

* First development pre-release on pub.dev.

---

# Planned Updates and New Features

These are the topics I currently have on the TODO list for this package. Have a new suggestion and idea?
Feel free to open a [suggestion or issue](https://github.com/rydmike/flex_color_picker/issues) in the repo.

### TODO

- Add more tests.
- Finalize tests.
- Add support for transparent on colors.  
- Add GitHub actions for test, analyze, coverage, build and web demo deployment.
- Additional controls for selecting active picker, custom slider and ToggleButtons.  
- Add one more color picker types "advanced".

### MAYBE
- Add a color selected with the wheel color selector to the custom colors section.
- Store colors added to the custom colors section.

### COMPLETED

- Review and update the API.
- Review and correct documentation mistakes and typos, first pass anyway.
- Fix doc images that show up OK in Github readme.md, but not on pub.dev.
- For the color wheel picker, add text input to get a given color based on entered HEX code.
- Add "name that color" function that can give a name to "any" color in English.
- Release version 1.0.0.
- Publish version 1.0.0 on pub.dev.
- Version 1.1.1: Add first set of tests for the ColorPicker, so far only unit tests for ColorTools, more tests will be added later. ColorTools has 4694 tests.
- Version 2.0.0-nullsafety.0: Add null safe version.
- Improve existing copy/paste feature.

