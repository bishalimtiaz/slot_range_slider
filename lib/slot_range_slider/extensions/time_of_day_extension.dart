import 'package:flutter/material.dart';

extension TimeOfDayExtension on TimeOfDay {
  TimeOfDay add({int hour = 0, int minute = 0}) {
    int tempHour = ((this.minute + minute)/60 >= 1) ? (this.hour + 1) : this.hour;
    int tempMinute = (this.minute+minute) % 60;
    return replacing(hour: tempHour + hour, minute: tempMinute);
  }
}