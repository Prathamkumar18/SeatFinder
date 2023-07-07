import 'package:flutter/material.dart';
import 'package:seat_finder/Utils/colors.dart';

class SeatItem extends StatelessWidget { 
  final int seatNumber;
  final int searchedSeat;
  final int flag;

  const SeatItem({
    Key? key,
    required this.seatNumber,
    required this.searchedSeat,
    required this.flag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double itemSize = screenWidth * 0.15;

    final berthType = getBerthType(seatNumber);
    final backgroundColor = seatNumber == searchedSeat
        ? Color.fromARGB(255, 109, 184, 245)
        : Color.fromARGB(255, 192, 230, 247);

    return Padding(
      padding: EdgeInsets.all(screenWidth * 0.005),
      child: Container(
        height: itemSize,
        width: itemSize,
        decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(color: Color.fromARGB(255, 211, 230, 246)),
          borderRadius: BorderRadius.circular(screenWidth * 0.03),
        ),
        padding: EdgeInsets.all(screenWidth * 0.02),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (flag == 0)
              Text(
                '$seatNumber',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: screenWidth * 0.05,
                  color: textColor,
                ),
              ),
            if (flag == 0) SizedBox(height: screenHeight * 0.005),
            Text(
              berthType,
              style: TextStyle(
                color: darkBlue,
                fontWeight: FontWeight.bold,
                fontSize: screenWidth * 0.018,
              ),
            ),
            if (flag == 1)
              Text(
                '$seatNumber',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: screenWidth * 0.05,
                  color: darkBlue,
                ),
              ),
            if (flag == 1) SizedBox(height: screenHeight * 0.005),
          ],
        ),
      ),
    );
  }

  String getBerthType(int seatNumber) {
    final int remainder = seatNumber % 8;
    if (remainder == 1 || remainder == 4) {
      return 'LOWER';
    } else if (remainder == 2 || remainder == 5) {
      return 'MIDDLE';
    } else if (remainder == 3 || remainder == 6) {
      return 'UPPER';
    } else if (remainder == 7) {
      return 'SIDE LOWER';
    } else {
      return 'SIDE UPPER';
    }
  }
}
