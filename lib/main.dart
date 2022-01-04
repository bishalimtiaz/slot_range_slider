import 'package:flutter/material.dart';
import 'package:slot_range_slider/slot_range_slider/model/booked_slot.dart';
import 'package:slot_range_slider/slot_range_slider/model/slot.dart';
import 'package:slot_range_slider/slot_range_slider/slot_range_slider.dart';
import 'package:slot_range_slider/slot_range_slider/values/enums.dart';

void main() {
  //debugRepaintRainbowEnabled = true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const Scaffold(body: MyHomePage()),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SlotRangeSlider(
        startTime: const TimeOfDay(hour: 10, minute: 0),
        endTime: const TimeOfDay(hour: 20, minute: 30),
        listOfBookedLots: _getDummyList(),
        onSlotSelected: onSlotSelected,
        sliderType: SliderType.RANGE, //default SliderType.OVERVIEW and is not selectable
        //windowColor: Colors.red,
      ),
    );
  }
}

void onSlotSelected(List<Slot> slots){
  slots.forEach((element) {
    print("start: ${element.startTime} end: ${element.endTime}");
  });

}

List<BookedSlot> _getDummyList() {
  final List<BookedSlot> dummyList = [];
 /* dummyList.add(BookedSlot(startTime: const TimeOfDay(hour: 10,minute: 00)));
  dummyList.add(BookedSlot(startTime: const TimeOfDay(hour: 10, minute: 30)));*/
  dummyList.add(BookedSlot(startTime: const TimeOfDay(hour: 11, minute: 00)));
  dummyList.add(BookedSlot(startTime: const TimeOfDay(hour: 11, minute: 30)));
  dummyList.add(BookedSlot(startTime: const TimeOfDay(hour: 12, minute: 00)));
  /*dummyList.add(BookedSlot(startTime: const TimeOfDay(hour: 12,minute: 30)));
  dummyList.add(BookedSlot(startTime: const TimeOfDay(hour: 13,minute: 00)));
  dummyList.add(BookedSlot(startTime: const TimeOfDay(hour: 13,minute: 30)));
  dummyList.add(BookedSlot(startTime: const TimeOfDay(hour: 14,minute: 00)));
  dummyList.add(BookedSlot(startTime: const TimeOfDay(hour: 14,minute: 30)));
  dummyList.add(BookedSlot(startTime: const TimeOfDay(hour: 15,minute: 00)));*/
  dummyList.add(BookedSlot(startTime: const TimeOfDay(hour: 15, minute: 30)));
  dummyList.add(BookedSlot(startTime: const TimeOfDay(hour: 16, minute: 00)));
  dummyList.add(BookedSlot(startTime: const TimeOfDay(hour: 16, minute: 30)));
  dummyList.add(BookedSlot(startTime: const TimeOfDay(hour: 17, minute: 00)));
  // dummyList.add(BookedSlot(startTime: const TimeOfDay(hour: 17,minute: 30)));
  // dummyList.add(BookedSlot(startTime: const TimeOfDay(hour: 18,minute: 00)));
  // dummyList.add(BookedSlot(startTime: const TimeOfDay(hour: 18,minute: 30)));
  dummyList.add(BookedSlot(startTime: const TimeOfDay(hour: 19,minute: 00)));
  //dummyList.add(BookedSlot(startTime: const TimeOfDay(hour: 19,minute: 30)));
  //dummyList.add(BookedSlot(startTime: const TimeOfDay(hour: 20,minute: 00)));

  return dummyList;
}
