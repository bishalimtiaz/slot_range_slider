import 'package:flutter/material.dart';
import 'package:slot_range_slider/slot_range_slider/custom_range_slider.dart';
import 'package:slot_range_slider/slot_range_slider/utils/slot_generator.dart';
import 'package:slot_range_slider/slot_range_slider/values/enums.dart';
import 'package:slot_range_slider/slot_range_slider/values/widget_values.dart';

import 'model/booked_slot.dart';
import 'model/slot.dart';

class SlotRangeSlider extends StatelessWidget {
  final TimeOfDay? startTime;
  final TimeOfDay? endTime;
  final int? timeSlot;
  final List<BookedSlot>? listOfBookedLots;
  late final List<Slot> _listOfSlots;
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
  final Color? leftHandlerIconColor;
  final Color? rightHandlerIconColor;
  final Color? leftHandlerBackgroundColor;
  final Color? rightHandlerBackgroundColor;
  final double? handlerRadius;
  final Function(List<Slot>) onSlotSelected;
  final SliderType sliderType;

  SlotRangeSlider(
      {Key? key,
      required this.startTime,
      required this.endTime,
      required this.onSlotSelected,
      this.listOfBookedLots,
      this.timeSlot = WidgetValues.defaultTimeSlot,
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
      this.leftHandlerIconColor,
      this.rightHandlerIconColor,
      this.leftHandlerBackgroundColor,
      this.rightHandlerBackgroundColor,
      this.handlerRadius,
      this.sliderType = SliderType.OVERVIEW})
      : super(key: key) {
    _listOfSlots = SlotGenerator(
      startTime: startTime,
      endTime: endTime,
      timeSlot: timeSlot,
      listOfBookedLots: listOfBookedLots,
    ).generateSlotList();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: CustomRangeSlide(
        listOfSlots: _listOfSlots,
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
        leftHandlerIconColor: leftHandlerIconColor,
        rightHandlerIconColor: rightHandlerIconColor,
        leftHandlerBackgroundColor: leftHandlerBackgroundColor,
        rightHandlerBackgroundColor: rightHandlerBackgroundColor,
        handlerRadius: handlerRadius,
        onSlotSelected: onSlotSelected,
        sliderType: sliderType,
      ),
    );
  }
}
