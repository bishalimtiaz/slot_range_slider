import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:slot_range_slider/slot_range_slider/render_custom_range_slider.dart';
import 'package:slot_range_slider/slot_range_slider/values/text_styles.dart';
import 'package:slot_range_slider/slot_range_slider/values/widget_values.dart';
import 'package:slot_range_slider/slot_range_slider/values/widget_colors.dart';

import 'model/slot.dart';

class CustomRangeSlide extends LeafRenderObjectWidget {
  final List<Slot> listOfSlots;
  final double? slotHeight;
  final double? slotWidth;
  final double? headerPadding;
  final Color? availableSlotColor;
  final Color? bookedSlotColor;
  final Color? dividerColor;
  final TextStyle? availableHeaderTextStyle;
  final TextStyle? bookedHeaderTextStyle;
  final double? dividerThickness;
  final Color? windowColor;
  final Function(List<Slot>) onSlotSelected;
  const CustomRangeSlide({
    required this.listOfSlots,
    required this.onSlotSelected,
    this.slotHeight,
    this.slotWidth,
    this.headerPadding,
    this.availableSlotColor,
    this.bookedSlotColor,
    this.dividerColor,
    this.availableHeaderTextStyle,
    this.bookedHeaderTextStyle,
    this.dividerThickness,
    this.windowColor,
    Key? key,
  }) : super(key: key);

  @override
  RenderCustomRangeSlider createRenderObject(BuildContext context) {
    return RenderCustomRangeSlider(
      listOfSlots: listOfSlots,
      slotHeight: slotHeight,
      slotWidth: slotWidth,
      headerPadding: headerPadding,
      availableSlotColor: availableSlotColor,
      bookedSlotColor: bookedSlotColor,
      dividerColor: dividerColor,
      availableHeaderTextStyle: availableHeaderTextStyle,
      bookedHeaderTextStyle: bookedHeaderTextStyle,
      dividerThickness: dividerThickness,
      windowColor: windowColor,
      buildContext: context,
      onSlotSelected: onSlotSelected,
    );
  }

  @override
  void updateRenderObject(BuildContext context, covariant RenderCustomRangeSlider renderObject) {

    renderObject
      ..slotHeight = slotHeight ?? WidgetValues.defaultSlotHeight
      ..slotWidth = slotWidth ?? WidgetValues.defaultSlotWidth
      ..headerPadding = headerPadding ?? WidgetValues.defaultHeaderPadding
      ..availableSlotColor = availableSlotColor ?? WidgetColors.defaultAvailableSlotColor
      ..bookedSlotColor = bookedSlotColor ?? WidgetColors.defaultBookedSlotColor
      ..dividerColor = dividerColor ?? WidgetColors.defaultDividerColor
      ..availableHeaderTextStyle = availableHeaderTextStyle ?? defaultAvailableSlotHeaderStyle
      ..bookedHeaderTextStyle = bookedHeaderTextStyle ?? defaultBookedSlotHeaderStyle
      ..dividerThickness = dividerThickness ?? WidgetValues.defaultDividerThickness
      ..windowColor = windowColor ?? WidgetColors.defaultWindowColor;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DoubleProperty('slotHeight', slotHeight));
    properties.add(DoubleProperty('slotWidth', slotWidth));
    properties.add(DoubleProperty('thumbSize', headerPadding));
    properties.add(ColorProperty("availableSlotColor", availableSlotColor));
    properties.add(ColorProperty("bookedSlotColor", bookedSlotColor));
    properties.add(ColorProperty("dividerColor", dividerColor));
    properties.add(DiagnosticsProperty("availableHeaderTextStyle", availableHeaderTextStyle));
    properties.add(DiagnosticsProperty("bookedHeaderTextStyle", bookedHeaderTextStyle));
    properties.add(DoubleProperty("dividerThickness", dividerThickness));
    properties.add(ColorProperty("windowColor", windowColor));
  }
}
