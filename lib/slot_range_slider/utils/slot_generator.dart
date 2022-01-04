import 'package:flutter/material.dart';
import 'package:slot_range_slider/slot_range_slider/extensions/time_of_day_extension.dart';
import 'package:slot_range_slider/slot_range_slider/values/widget_values.dart';
import '../model/booked_slot.dart';
import '../model/slot.dart';

class SlotGenerator {
  final TimeOfDay? startTime;
  final TimeOfDay? endTime;
  final int? timeSlot;
  final List<BookedSlot>? listOfBookedLots;

  SlotGenerator({
    this.startTime,
    this.endTime,
    this.timeSlot,
    this.listOfBookedLots,
  });

  Iterable<TimeOfDay> _getTimes(
      TimeOfDay startTime, TimeOfDay endTime, Duration step) sync* {
    var hour = startTime.hour;
    var minute = startTime.minute;
    const int maxMinute = 60;
    do {
      yield TimeOfDay(hour: hour, minute: minute);
      minute += step.inMinutes;
      while (minute >= maxMinute) {
        minute -= maxMinute;
        hour++;
      }
    } while (hour < endTime.hour ||
        (hour == endTime.hour && minute < endTime.minute));
  }

  List<Slot> generateSlotList() {
    int i = -1;
    return _getTimes(
      startTime ?? WidgetValues.defaultStartTime,
      endTime ?? WidgetValues.defaultEndTimeTime,
      Duration(minutes: timeSlot ?? WidgetValues.defaultTimeSlot),
    )
        .map((tod) => Slot(
              index: ++i,
              startTime: tod,
              endTime:
                  tod.add(minute: timeSlot ?? WidgetValues.defaultTimeSlot),
              isBooked: _isBookedSlot(tod),
            ))
        .toList();
  }

  bool _isBookedSlot(TimeOfDay tod) {
    return listOfBookedLots?.any((element) =>
            element.startTime.hour == tod.hour &&
            element.startTime.minute == tod.minute) ??
        false;
  }
}
