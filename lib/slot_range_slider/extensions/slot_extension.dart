import 'package:slot_range_slider/slot_range_slider/model/slot.dart';
import 'package:slot_range_slider/slot_range_slider/model/slot_selection_handler.dart';
import 'package:collection/collection.dart';

extension SlotExtension on List<Slot> {
  Slot? getSelectedSlot({
    required double dx,
    required double dy,
    required double slotWidth,
    required double slotHeight,
  }) {
    return firstWhereOrNull((element) =>
        (element.left <= dx && dx <= element.left + slotWidth) &&
        (element.top <= dy && dy <= element.top + slotHeight));
  }

  Slot? getNextSlot({required double dx, required double slotWidth}) {
    return firstWhereOrNull(
        (element) => (element.left < dx && dx < element.left + slotWidth));
  }

  void resetSelection({required double left, required double right}) {
    forEach((element) {
      if (left <= element.left && element.left < right) {
        element.isSelected = true;
      } else {
        element.isSelected = false;
      }
    });
  }

  void getSelectionRange({
    required int index,
    required double slotWidth,
    required SlotSelectionHandler handler,
  }) {
    handler.nearestBookedSlotLeft = _getNearestBookedSlotLeft(index, slotWidth);
    handler.nearestBookedSlotRight = _getNearestBookedSlotRight(index, slotWidth);
    //return handler;
  }

  double _getNearestBookedSlotLeft(int index, double slotWidth) {
    double leftRange = first.left;
    for (int i = index; i >= 0; i--) {
      if (this[i].isBooked){
        leftRange = this[i].left + slotWidth;
        break;
      }
    }
    print("leftRange: $leftRange");
    return leftRange;
  }

  double _getNearestBookedSlotRight(int index, double slotWidth) {
    double rightRange = last.left + slotWidth;

    for (int i = ++index; i < length; i++) {
      //print("index: $i isBooked: ${this[i].isBooked} left: ${this[i].left}");
      if (this[i].isBooked){
        rightRange = this[i].left;
        break;
      }
    }
    print("rightRange: $rightRange");
    return rightRange;
  }
}
