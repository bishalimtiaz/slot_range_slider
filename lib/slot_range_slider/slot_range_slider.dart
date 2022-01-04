
import 'package:flutter/material.dart';
import 'package:slot_range_slider/slot_range_slider/custom_range_slider.dart';
import 'package:slot_range_slider/slot_range_slider/utils/slot_generator.dart';
import 'package:slot_range_slider/slot_range_slider/values/enums.dart';
import 'package:slot_range_slider/slot_range_slider/values/widget_values.dart';

import 'model/booked_slot.dart';
import 'model/slot.dart';

class SlotRangeSlider extends StatefulWidget {
  final TimeOfDay? startTime;
  final TimeOfDay? endTime;
  final int? timeSlot;
  final List<BookedSlot>? listOfBookedLots;
  late final List<Slot> _listOfSlots;
  final double? slotHeight;
  final double? slotWidth;
  final double? headerPadding;
  final Function(List<Slot>) onSlotSelected;
  final SliderType sliderType;


  SlotRangeSlider({
    Key? key,
    required this.startTime,
    required this.endTime,
    required this.onSlotSelected,
    this.listOfBookedLots,
    this.timeSlot = WidgetValues.defaultTimeSlot,
    this.slotHeight,
    this.slotWidth,
    this.headerPadding,
    this.sliderType = SliderType.OVERVIEW

  }) : super(key: key) {
    _listOfSlots = SlotGenerator(
            startTime: startTime,
            endTime: endTime,
            timeSlot: timeSlot,
            listOfBookedLots: listOfBookedLots)
        .generateSlotList();

    ///Need Optimization**/
    /*_listOfSlots.forEach((element) {
      print("start: ${element.startTime} end: ${element.endTime} index: ${element.index} isBooked: ${element.isBooked}");
    });
    print("length: ${_listOfSlots.length}");*/
  }

  @override
  _SlotRangeSliderState createState() => _SlotRangeSliderState();
}

class _SlotRangeSliderState extends State<SlotRangeSlider> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: CustomRangeSlide(
        listOfSlots: widget._listOfSlots,
        slotHeight: widget.slotHeight,
        slotWidth: widget.slotWidth,
        headerPadding: widget.headerPadding,
        onSlotSelected: widget.onSlotSelected,
        sliderType: widget.sliderType,
      ),
    );
  }
}
