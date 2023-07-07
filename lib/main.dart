import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Screens/seat_finder_screen.dart';

void main() {
  runApp(SeatFinderApp());
}

class SeatFinderApp extends StatelessWidget {
  const SeatFinderApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Seat Finder',
      home: SeatFinderScreen(),
    );
  }
}



