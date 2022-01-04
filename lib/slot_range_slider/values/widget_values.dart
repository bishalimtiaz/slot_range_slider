import 'package:flutter/material.dart';

abstract class WidgetValues{
  static const double defaultHeaderPadding = 8;
  static const double defaultSlotHeight = 85;
  static const double defaultSlotWidth = 60;
  static const double smallPadding = 4;
  static const double extraPadding = 32;
  static const double defaultDividerThickness = 2;
  static const int defaultTimeSlot = 30;
  static const TimeOfDay defaultStartTime = TimeOfDay(hour: 8, minute: 1);
  static const TimeOfDay defaultEndTimeTime = TimeOfDay(hour: 22, minute: 0);
  static const double defaultFontSize = 12;
  static const double defaultHandlerRadius = 14;
}