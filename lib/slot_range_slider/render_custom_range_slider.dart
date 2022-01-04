import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:slot_range_slider/slot_range_slider/extensions/slot_extension.dart';
import 'package:slot_range_slider/slot_range_slider/model/slot_selection_handler.dart';
import 'package:slot_range_slider/slot_range_slider/values/enums.dart';
import 'package:slot_range_slider/slot_range_slider/values/text_styles.dart';
import 'package:slot_range_slider/slot_range_slider/values/widget_values.dart';
import 'package:slot_range_slider/slot_range_slider/values/widget_colors.dart';
import 'model/slot.dart';
import 'dart:math' as math;
import 'package:collection/collection.dart';

class RenderCustomRangeSlider extends RenderBox {
  ///Property Initialization**/

  late final double _textHeight;

  ///BuildContext**/
  BuildContext _buildContext;
  BuildContext get buildContext => _buildContext;
  set buildContext(BuildContext context) {
    if (_buildContext == context) return;
    _buildContext = context;
  }

  /// Available Slot Color**/
  Color _availableSlotColor;
  Color get availableSlotColor => _availableSlotColor;
  set availableSlotColor(Color value) {
    if (_availableSlotColor == value) {
      return;
    }
    _availableSlotColor = value;
    markNeedsPaint();
  }

  ///Booked Slot Color**/
  Color _bookedSlotColor;
  Color get bookedSlotColor => _bookedSlotColor;
  set bookedSlotColor(Color value) {
    if (_bookedSlotColor == value) {
      return;
    }
    _bookedSlotColor = value;
    markNeedsPaint();
  }

  ///Booked Slot Color**/
  Color _dividerColor;
  Color get dividerColor => _dividerColor;
  set dividerColor(Color value) {
    if (_dividerColor == value) {
      return;
    }
    _dividerColor = value;
    markNeedsPaint();
  }

  ///Window Color**/
  Color _windowColor;
  Color get windowColor => _windowColor;
  set windowColor(Color value) {
    if (_windowColor == value) return;
    _windowColor = value;
    markNeedsPaint();
  }

  ///Left Handler Icon Color**/
  Color _leftHandlerIconColor;
  Color get leftHandlerIconColor => _leftHandlerIconColor;
  set leftHandlerIconColor(Color value) {
    if (_leftHandlerIconColor == value) return;
    _leftHandlerIconColor = value;
    markNeedsPaint();
  }

  ///Right Handler Icon Color**/
  Color _rightHandlerIconColor;
  Color get rightHandlerIconColor => _rightHandlerIconColor;
  set rightHandlerIconColor(Color value) {
    if (_rightHandlerIconColor == value) return;
    _rightHandlerIconColor = value;
    markNeedsPaint();
  }

  ///Left Handler Background Color**/
  Color _leftHandlerBackgroundColor;
  Color get leftHandlerBackgroundColor => _leftHandlerBackgroundColor;
  set leftHandlerBackgroundColor(Color value) {
    if (_leftHandlerBackgroundColor == value) return;
    _leftHandlerBackgroundColor = value;
    markNeedsPaint();
  }

  ///Right Handler Background Color**/
  Color _rightHandlerBackgroundColor;
  Color get rightHandlerBackgroundColor => _rightHandlerBackgroundColor;
  set rightHandlerBackgroundColor(Color value) {
    if (_rightHandlerBackgroundColor == value) return;
    _rightHandlerBackgroundColor = value;
    markNeedsPaint();
  }

  ///availableHeaderTextStyle**/
  TextStyle _availableHeaderTextStyle;
  TextStyle get availableHeaderTextStyle => _availableHeaderTextStyle;
  set availableHeaderTextStyle(TextStyle style) {
    if (_availableHeaderTextStyle == style) return;
    _availableHeaderTextStyle = style;
    markNeedsPaint();
  }

  ///bookedHeaderTextStyle**/
  TextStyle _bookedHeaderTextStyle;
  TextStyle get bookedHeaderTextStyle => _bookedHeaderTextStyle;
  set bookedHeaderTextStyle(TextStyle style) {
    if (_bookedHeaderTextStyle == style) return;
    _bookedHeaderTextStyle = style;
    markNeedsPaint();
  }

  ///Slot Height**/
  double _slotHeight;
  double get slotHeight => _slotHeight;
  set slotHeight(double value) {
    if (_slotHeight == value) return;
    _slotHeight = value;
    markNeedsLayout();
  }

  ///**Slot Width**/
  double _slotWidth;
  double get slotWidth => _slotWidth;
  set slotWidth(double value) {
    if (_slotWidth == value) return;

    _slotWidth = value;
    markNeedsLayout();
  }

  double _dividerThickness;
  double get dividerThickness => _dividerThickness;
  set dividerThickness(double value) {
    if (_dividerThickness == value) return;
    _dividerThickness = value;
    markNeedsPaint();
  }

  ///HeaderPadding*//
  double _headerPadding;
  double get headerPadding => _headerPadding;
  set headerPadding(double value) {
    if (_headerPadding == value) return;

    _headerPadding = value;
    markNeedsLayout();
  }

  ///LHandler Radius**/
  double _handlerRadius;
  double get handlerRadius => _handlerRadius;
  set handlerRadius(double value) {
    if (_handlerRadius == value) return;
    _handlerRadius = value;
    markNeedsPaint();
  }

  ///list of Slots**/
  List<Slot> _listOfSlots;
  List<Slot> get listOfSlots => _listOfSlots;
  set listOfSlots(List<Slot> list) {
    _listOfSlots.clear();
    _listOfSlots = list;
    markNeedsLayout();
  }

  RenderCustomRangeSlider({
    required List<Slot> listOfSlots,
    required BuildContext buildContext,
    double? slotHeight,
    double? slotWidth,
    double? headerPadding,
    Color? availableSlotColor,
    Color? bookedSlotColor,
    Color? dividerColor,
    TextStyle? availableHeaderTextStyle,
    TextStyle? bookedHeaderTextStyle,
    double? dividerThickness,
    Color? windowColor,
    Color? leftHandlerIconColor,
    Color? rightHandlerIconColor,
    Color? leftHandlerBackgroundColor,
    Color? rightHandlerBackgroundColor,
    double? handlerRadius,
  })  : _slotHeight = slotHeight ?? WidgetValues.defaultSlotHeight,
        _slotWidth = slotWidth ?? WidgetValues.defaultSlotWidth,
        _headerPadding = headerPadding ?? WidgetValues.defaultHeaderPadding,
        _listOfSlots = listOfSlots,
        _availableSlotColor =
            availableSlotColor ?? WidgetColors.defaultAvailableSlotColor,
        _bookedSlotColor =
            bookedSlotColor ?? WidgetColors.defaultBookedSlotColor,
        _dividerColor = dividerColor ?? WidgetColors.defaultDividerColor,
        _availableHeaderTextStyle =
            availableHeaderTextStyle ?? defaultAvailableSlotHeaderStyle,
        _bookedHeaderTextStyle =
            bookedHeaderTextStyle ?? defaultBookedSlotHeaderStyle,
        _buildContext = buildContext,
        _dividerThickness =
            dividerThickness ?? WidgetValues.defaultDividerThickness,
        _windowColor = windowColor ?? WidgetColors.defaultWindowColor,
        _leftHandlerIconColor =
            leftHandlerIconColor ?? WidgetColors.defaultHandlerIconColor,
        _rightHandlerIconColor =
            rightHandlerIconColor ?? WidgetColors.defaultHandlerIconColor,
        _leftHandlerBackgroundColor = leftHandlerBackgroundColor ??
            WidgetColors.defaultHandlerBackgroundColor,
        _rightHandlerBackgroundColor = rightHandlerBackgroundColor ??
            WidgetColors.defaultHandlerBackgroundColor,
        _handlerRadius = handlerRadius ?? WidgetValues.defaultHandlerRadius {
    ///Constructor Body**/

    _initializeDragGestureListener();
    _initializeTapGestureListener();

    ///get text height from font size**/

    _textHeight = math.max(
            _availableHeaderTextStyle.fontSize ?? WidgetValues.defaultFontSize,
            _bookedHeaderTextStyle.fontSize ?? WidgetValues.defaultFontSize) +
        2;

    ///Initialize Paints*/
    _initializePaints();
  }

  ///Layout Size i,e: set Height Width**/

  @override
  void performLayout() {
    size = computeDryLayout(constraints);
  }

  @override
  Size computeDryLayout(BoxConstraints constraints) {
    final desiredWidth = _calculateLayoutWidth();
    final desiredHeight = _calculateLayoutHeight();
    final desiredSize = Size(desiredWidth, desiredHeight);
    return constraints.constrain(desiredSize);
  }

  @override
  double computeMinIntrinsicWidth(double height) =>
      slotWidth + _leftPadding + _rightPadding + handlerRadius;
  @override
  double computeMaxIntrinsicWidth(double height) =>
      slotWidth + _leftPadding + _rightPadding + handlerRadius;
  @override
  double computeMinIntrinsicHeight(double width) =>
      slotHeight + headerPadding + _topPadding + _bottomPadding;
  @override
  double computeMaxIntrinsicHeight(double width) =>
      slotHeight + headerPadding + _topPadding + _bottomPadding;

  ///Painting Section
  ///
  ///**/

  double _currentThumbValue = 0.5;

  final double _leftPadding = 4.0;
  final double _rightPadding = 4.0;
  final double _topPadding = 4.0;
  final double _bottomPadding = 4.0;
  double _windowTop = 0.0;
  double _windowLeft = 0.0;
  double _windowRight = 0.0;
  double _windowWidth = 0.0;
  bool _isWindowSet = false;
  final _leftHandlerIcon = Icons.arrow_back_ios_rounded;
  final _rightHandlerIcon = Icons.arrow_forward_ios_rounded;
  DragEvent _dragEvent = DragEvent.WINDOW;
  final SlotSelectionHandler _selectionHandler = SlotSelectionHandler();
  late final Paint availableSlotPaint;
  late final Paint bookedSlotPaint;
  late final Paint dividerPaint;
  late final Paint windowPaint;
  late final Paint leftHandlerBackgroundPaint;
  late final Paint rightHandlerBackgroundPaint;

  void _initializePaints(){

     availableSlotPaint = Paint()
      ..color = availableSlotColor
      ..isAntiAlias = true;

     bookedSlotPaint = Paint()
       ..color = bookedSlotColor
       ..isAntiAlias = true;

      dividerPaint = Paint()
       ..color = dividerColor
       ..strokeWidth = dividerThickness
       ..isAntiAlias = true;

      windowPaint = Paint()
       ..color = windowColor
       ..isAntiAlias = true;

      leftHandlerBackgroundPaint = Paint()
       ..color = leftHandlerBackgroundColor
       ..isAntiAlias = true;

      rightHandlerBackgroundPaint = Paint()
       ..color = rightHandlerBackgroundColor
       ..isAntiAlias = true;

  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final canvas = context.canvas;
    canvas.save();
    canvas.translate(offset.dx, offset.dy);


    ///Draw Items**/

    for (int i = 0; i < listOfSlots.length; i++) {

      ///Draw Header**/
      if (i % 2 == 0) {
        if (listOfSlots[i].isBooked) {
          ///Booked Header Text**/

          final bookedHeaderTextPainter = TextPainter(
            text: TextSpan(
              text: listOfSlots[i].startTime.format(buildContext),
              style: bookedHeaderTextStyle,
            ),
            textDirection: TextDirection.ltr,
          );

          bookedHeaderTextPainter.layout();
          bookedHeaderTextPainter.paint(
            canvas,
            Offset(
              0 + _leftPadding + (handlerRadius/2) + (i * slotWidth),
              0 + _topPadding,
            ),
          );

          ///Booked Header Text {END}**/

        } else {
          ///available Header Text**/

          final availableHeaderTextPainter = TextPainter(
            text: TextSpan(
              text: listOfSlots[i].startTime.format(buildContext),
              style: availableHeaderTextStyle,
            ),
            textDirection: TextDirection.ltr,
          );

          availableHeaderTextPainter.layout();
          availableHeaderTextPainter.paint(
            canvas,
            Offset(
              0 + _leftPadding + (handlerRadius/2) + (i * slotWidth),
              0 + _topPadding,
            ),
          );

          ///available Header Text {END}**/

        }
      }

      /// Draw Slots**/
      canvas.drawRect(
        Rect.fromLTWH(
          0 + _leftPadding + (handlerRadius/2) + (i * slotWidth),
          0 + _topPadding + _textHeight + headerPadding,
          slotWidth,
          slotHeight,
        ),
        (listOfSlots[i].isBooked) ? bookedSlotPaint : availableSlotPaint,
      );

      ///store slot coordinates
      listOfSlots[i].left = 0 + _leftPadding + (handlerRadius/2) + (i * slotWidth);
      listOfSlots[i].top = 0 + _topPadding + _textHeight + headerPadding;

      /// Draw Divider**/
      if (i != 0) {
        canvas.drawLine(
          Offset(
            0 + _leftPadding + (handlerRadius/2) + (i * slotWidth),
            0 + _topPadding + _textHeight + headerPadding,
          ),
          Offset(
            0 + _leftPadding + (handlerRadius/2) + (i * slotWidth),
            0 +
                _topPadding +
                _textHeight +
                headerPadding +
                ((i % 2 == 0) ? slotHeight : (slotHeight / 8)),
          ),
          dividerPaint,
        );
      }
    }

    ///{End of For}*///
    ///
    ///set window to first available slot**/

    if (!_isWindowSet) {
      Slot? slot = listOfSlots.firstWhereOrNull((element) => !element.isBooked);
      if (slot != null) {
        _windowTop = slot.top;
        _windowLeft = slot.left;
        _windowRight = _windowLeft + slotWidth;
        slot.isSelected = true;
        _isWindowSet = true;
        _windowWidth = slotWidth;
        listOfSlots.getSelectionRange(
          index: slot.index,
          slotWidth: slotWidth,
          handler: _selectionHandler,
        );
      }
    }

    ///Draw Window**/

    canvas.drawRect(
      Rect.fromLTRB(
        _windowLeft,
        _windowTop,
        _windowRight,
        _windowTop + slotHeight,
      ),
      windowPaint,
    );

    ///Draw Left Handler

    canvas.drawCircle(
      Offset(
        _windowLeft,
        _windowTop + (slotHeight / 2),
      ),
      handlerRadius,
      leftHandlerBackgroundPaint,
    );

    final leftHandlerTextSpan = TextSpan(
      text: String.fromCharCode(
        _leftHandlerIcon.codePoint,
      ),
      style: TextStyle(
        fontSize: handlerRadius,
        fontFamily: _leftHandlerIcon.fontFamily,
        color: leftHandlerIconColor,
      ),
    );

    final leftHandlerTextPainter = TextPainter(
        textDirection: TextDirection.ltr, text: leftHandlerTextSpan);

    leftHandlerTextPainter.layout();
    leftHandlerTextPainter.paint(
      canvas,
      Offset(
        _windowLeft - (leftHandlerTextPainter.width / 2),
        _windowTop + (slotHeight / 2) - (leftHandlerTextPainter.height / 2),
      ),
    );

    ///Draw Right Handler

    canvas.drawCircle(
      Offset(
        _windowRight,
        _windowTop + (slotHeight / 2),
      ),
      handlerRadius,
      rightHandlerBackgroundPaint,
    );

    final rightHandlerTextSpan = TextSpan(
      text: String.fromCharCode(
        _rightHandlerIcon.codePoint,
      ),
      style: TextStyle(
        fontSize: handlerRadius,
        fontFamily: _rightHandlerIcon.fontFamily,
        color: rightHandlerIconColor,
      ),
    );

    final rightHandlerTextPainter = TextPainter(
        textDirection: TextDirection.ltr, text: rightHandlerTextSpan);
    rightHandlerTextPainter.layout();
    rightHandlerTextPainter.paint(
      canvas,
      Offset(
        _windowRight - (leftHandlerTextPainter.width / 2),
        _windowTop + (slotHeight / 2) - (leftHandlerTextPainter.height / 2),
      ),
    );

    canvas.restore();
  }

  /// Touch Events**/

  late HorizontalDragGestureRecognizer _drag;
  void _initializeDragGestureListener() {
    _drag = HorizontalDragGestureRecognizer()
      ..onStart = (DragStartDetails details) {
        //_updateWindow(details.localPosition);
      }
      ..onUpdate = (DragUpdateDetails details) {
        _updateWindow(details.localPosition);
      }
      ..onEnd = (DragEndDetails details) {
        _completeDragging();
      };
  }

  void _updateWindow(Offset position) {
    double dx = position.dx
        .clamp(0 + _leftPadding, size.width - slotWidth - _rightPadding);

    switch (_dragEvent) {
      case DragEvent.LEFT:
        if (dx > _selectionHandler.nearestBookedSlotLeft &&
            dx < (_windowRight - slotWidth)) {
          _windowLeft = dx;
          markNeedsPaint();
          markNeedsSemanticsUpdate();
        }
        break;
      case DragEvent.RIGHT:
        if (dx < _selectionHandler.nearestBookedSlotRight &&
            (dx > (_windowLeft + slotWidth) || dx == listOfSlots.last.left)) {
          _windowRight = (dx <= listOfSlots.last.left)
              ? dx
              : math.min(
                  ++_windowRight, _selectionHandler.nearestBookedSlotRight);
          markNeedsPaint();
          markNeedsSemanticsUpdate();
        }
        break;
      case DragEvent.WINDOW:
        if (dx > _selectionHandler.nearestBookedSlotLeft &&
            (dx + _windowWidth) < _selectionHandler.nearestBookedSlotRight) {
          _windowLeft = dx;
          _windowRight = _windowLeft + _windowWidth;
          markNeedsPaint();
          markNeedsSemanticsUpdate();
        }

        break;
      default:
        break;
    }
  }

  void _completeDragging() {
    switch (_dragEvent) {
      case DragEvent.LEFT:
        var slot =
            listOfSlots.getNextSlot(dx: _windowLeft, slotWidth: slotWidth);
        if (slot != null) {
          if (slot.left >= _selectionHandler.nearestBookedSlotLeft) {
            ///set window left to nearest of slot points
            if ((_windowLeft - slot.left) <
                (slot.left + slotWidth - _windowLeft)) {
              _windowLeft = slot.left;
            } else {
              _windowLeft = slot.left + slotWidth;
            }
            _windowWidth = _windowRight - _windowLeft;

            ///call paint method and refresh
            markNeedsPaint();
            markNeedsSemanticsUpdate();
            listOfSlots.resetSelection(left: _windowLeft, right: _windowRight);
          }
        }

        break;
      case DragEvent.RIGHT:
        var slot =
            listOfSlots.getNextSlot(dx: _windowRight, slotWidth: slotWidth);
        if (slot != null) {
          if ((slot.left + slotWidth) <=
              _selectionHandler.nearestBookedSlotRight) {
            ///set window left to nearest of slot points
            if ((_windowRight - slot.left) <
                (slot.left + slotWidth - _windowRight)) {
              _windowRight = slot.left;
            } else {
              _windowRight = slot.left + slotWidth;
            }
            _windowWidth = _windowRight - _windowLeft;
            ///call paint method and refresh
            markNeedsPaint();
            markNeedsSemanticsUpdate();
            listOfSlots.resetSelection(left: _windowLeft, right: _windowRight);
          }
        }

        break;
      case DragEvent.WINDOW:
        var slot =
            listOfSlots.getNextSlot(dx: _windowLeft, slotWidth: slotWidth);
        if (slot != null) {
          if (slot.left >= _selectionHandler.nearestBookedSlotLeft) {
            //print("complete drawing _windowLeft: $_windowLeft _windowRight: $_windowRight");

            ///call paint method and refresh
            if ((_windowLeft - slot.left) <
                (slot.left + slotWidth - _windowLeft)) {
              _windowLeft = slot.left;
            } else {
              _windowLeft = slot.left + slotWidth;
            }
            _windowRight = _windowWidth + _windowLeft;

            markNeedsPaint();
            markNeedsSemanticsUpdate();
            listOfSlots.resetSelection(left: _windowLeft, right: _windowRight);
          }
          /*if ((slot.left + slotWidth) <=
              _selectionHandler.nearestBookedSlotRight) {
            _windowRight = _windowLeft + _windowWidth;
          }*/
        }

        break;
      default:
        break;
    }
  }

  late TapGestureRecognizer _tap;
  void _initializeTapGestureListener() {
    _tap = TapGestureRecognizer()
      ..onTapUp = (TapUpDetails details) {
        _setNewWindow(details.localPosition);
      };
  }

  void _setNewWindow(Offset localPosition) {
    final slot = listOfSlots.getSelectedSlot(
        dx: localPosition.dx,
        dy: localPosition.dy,
        slotWidth: slotWidth,
        slotHeight: slotHeight);

    if (slot == null) return;

    if (!slot.isBooked && !slot.isSelected) {
      _windowLeft = slot.left;
      _windowTop = slot.top;
      _windowRight = slot.left + slotWidth;
      markNeedsPaint();
      listOfSlots.getSelectionRange(
          index: slot.index, slotWidth: slotWidth, handler: _selectionHandler);
    }
    listOfSlots.resetSelection(left: _windowLeft, right: _windowRight);
  }

  @override
  bool hitTestSelf(Offset position) => true;

  @override
  void handleEvent(PointerEvent event, BoxHitTestEntry entry) {
    assert(debugHandleEvent(event, entry));
    if (event is PointerDownEvent) {
      _tap.addPointer(event);

      if (_isLeftHandlerDraggable(event.localPosition) ||
          _isRightHandlerDraggable(event.localPosition)) {
        _drag.addPointer(event);
      } else if (_isWindowDraggable(event.localPosition)) {
        _drag.addPointer(event);
      }
    }
  }

  bool _isWindowDraggable(Offset position) {
    bool flag = (_windowLeft <= position.dx && position.dx <= _windowRight) &&
        (_windowTop <= position.dy && position.dy <= _windowTop + slotHeight);

    if (flag) _dragEvent = DragEvent.WINDOW;
    return flag;
  }

  bool _isLeftHandlerDraggable(Offset position) {
    final D = math.sqrt(
      math.pow(_windowLeft - position.dx, 2) +
          math.pow((_windowTop + (slotHeight / 2) - position.dy), 2),
    );
    if (D <= handlerRadius) _dragEvent = DragEvent.LEFT;

    return D <= handlerRadius;
  }

  bool _isRightHandlerDraggable(Offset position) {
    final D = math.sqrt(
      math.pow(_windowRight - position.dx, 2) +
          math.pow((_windowTop + (slotHeight / 2) - position.dy), 2),
    );
    if (D <= handlerRadius) _dragEvent = DragEvent.RIGHT;

    return D <= handlerRadius;
  }

  @override
  bool get isRepaintBoundary => true;

  @override
  void describeSemanticsConfiguration(SemanticsConfiguration config) {
    super.describeSemanticsConfiguration(config);

    // description
    config.textDirection = TextDirection.ltr;
    config.label = 'Progress bar';
    config.value = '${(_currentThumbValue * 100).round()}%';

    // increase action
    config.onIncrease = increaseAction;
    final increased = _currentThumbValue + _semanticActionUnit;
    config.increasedValue = '${((increased).clamp(0.0, 1.0) * 100).round()}%';

    // decrease action
    config.onDecrease = decreaseAction;
    final decreased = _currentThumbValue - _semanticActionUnit;
    config.decreasedValue = '${((decreased).clamp(0.0, 1.0) * 100).round()}%';
  }

  static const double _semanticActionUnit = 0.05;

  void increaseAction() {
    final newValue = _currentThumbValue + _semanticActionUnit;
    _currentThumbValue = (newValue).clamp(0.0, 1.0);
    markNeedsPaint();
    markNeedsSemanticsUpdate();
  }

  void decreaseAction() {
    final newValue = _currentThumbValue - _semanticActionUnit;
    _currentThumbValue = (newValue).clamp(0.0, 1.0);
    markNeedsPaint();
    markNeedsSemanticsUpdate();
  }

  ///Calculate Layout Height Width**/

  double _calculateLayoutHeight() {
    return slotHeight +
        headerPadding +
        _topPadding +
        _bottomPadding +
        _textHeight;
  }

  double _calculateLayoutWidth() {
    return slotWidth * listOfSlots.length + _leftPadding + _rightPadding + handlerRadius;
  }
}
