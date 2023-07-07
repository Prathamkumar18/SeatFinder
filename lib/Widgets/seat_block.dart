// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:seat_finder/Widgets/seat_item.dart';

class SeatBlock extends StatelessWidget {
  final int blockNumber;
  final int seatsPerBlock;
  final int searchedSeat;
  final Function(int) onTapSeat;

  const SeatBlock({
    Key? key,
    required this.blockNumber,
    required this.seatsPerBlock,
    required this.searchedSeat,
    required this.onTapSeat,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.all(screenWidth * 0.02),
      child: Card(
        margin: EdgeInsets.all(screenWidth * 0.005),
        elevation: 0,
        color: Color.fromARGB(255, 246, 251, 255),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: screenHeight * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                for (int seatNumber = 1; seatNumber <= 3; seatNumber++)
                  GestureDetector(
                    onTap: () => onTapSeat(
                        seatNumber + ((blockNumber - 1) * seatsPerBlock)),
                    child: SeatItem(
                      flag: 0,
                      seatNumber:
                          seatNumber + ((blockNumber - 1) * seatsPerBlock),
                      searchedSeat: searchedSeat,
                    ),
                  ),
                SizedBox(
                  width: screenWidth * 0.25,
                ),
                GestureDetector(
                  onTap: () =>
                      onTapSeat(7 + ((blockNumber - 1) * seatsPerBlock)),
                  child: SeatItem(
                    flag: 0,
                    seatNumber: 7 + ((blockNumber - 1) * seatsPerBlock),
                    searchedSeat: searchedSeat,
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.01),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                for (int seatNumber = 4; seatNumber <= 6; seatNumber++)
                  GestureDetector(
                    onTap: () => onTapSeat(
                        seatNumber + ((blockNumber - 1) * seatsPerBlock)),
                    child: SeatItem(
                      flag: 1,
                      seatNumber:
                          seatNumber + ((blockNumber - 1) * seatsPerBlock),
                      searchedSeat: searchedSeat,
                    ),
                  ),
                SizedBox(width: screenWidth * 0.25),
                GestureDetector(
                  onTap: () =>
                      onTapSeat(8 + ((blockNumber - 1) * seatsPerBlock)),
                  child: SeatItem(
                    flag: 1,
                    seatNumber: 8 + ((blockNumber - 1) * seatsPerBlock),
                    searchedSeat: searchedSeat,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: screenHeight * 0.01,
            ),
          ],
        ),
      ),
    );
  }
}
