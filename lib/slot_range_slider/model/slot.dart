import 'package:flutter/material.dart';

class Slot {
  final int index;
  final TimeOfDay startTime;
  final TimeOfDay endTime;
  final bool isBooked;
  double left;
  double top;
  bool isSelected;

  Slot({
    required this.index,
    required this.startTime,
    required this.endTime,
    this.isBooked = false,
    this.left = 0.0,
    this.top = 0.0,
    this.isSelected = false,
  });
}
