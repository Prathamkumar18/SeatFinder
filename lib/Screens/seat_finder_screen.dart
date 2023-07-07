import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:seat_finder/Utils/colors.dart';
import 'package:seat_finder/Utils/message.dart';
import 'package:seat_finder/Widgets/seat_item.dart';
import '../Widgets/seat_block.dart';

class SeatFinderScreen extends StatefulWidget {
  const SeatFinderScreen({super.key});

  @override
  _SeatFinderScreenState createState() => _SeatFinderScreenState();
}

class _SeatFinderScreenState extends State<SeatFinderScreen> {
  final int blockCount = 10;
  final int seatsPerBlock = 8;
  final TextEditingController searchController = TextEditingController();
  final ScrollController scrollController = ScrollController();
  int searchedSeat = 0;
  bool flagSearch = false;

  @override
  void dispose() {
    searchController.dispose();
    scrollController.dispose();
    super.dispose();
  }

  bool _isNumeric(String result) {
    if (result == null) {
      return false;
    }
    return int.tryParse(result) != null;
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: background),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Text(
              "Seat Finder",
              style: TextStyle(
                fontSize: screenWidth * 0.08,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 47, 159, 250),
              ),
            ),
          ),
          Container(
            height: screenHeight * 0.07,
            width: screenWidth,
            margin: EdgeInsets.all(screenWidth * 0.03),
            decoration: BoxDecoration(
              border: Border.all(color: textColor),
              borderRadius: BorderRadius.circular(screenWidth * 0.02),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(screenWidth * 0.02),
                    child: TextField(
                      style: TextStyle(
                        decorationColor: textColor,
                        backgroundColor: background,
                        color: textColor,
                      ),
                      controller: searchController,
                      onChanged: (value) {
                        setState(() {
                          if (_isNumeric(value) == false) {
                            flagSearch = false;
                          } else if (int.parse(value) < 1 ||
                              int.parse(value) > 80) {
                            flagSearch = false;
                          } else if (value.isEmpty) {
                            flagSearch = false;
                          } else if (value.isNotEmpty) {
                            RegExp _regExp = RegExp(r'^[0-9]+$');
                            _regExp.hasMatch(value) == true
                                ? flagSearch = true
                                : flagSearch = false;
                          }
                        });
                      },
                      decoration: InputDecoration(
                        hintText: 'Enter Seat Number...',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: screenWidth * 0.02),
                InkWell(
                  onTap: () {
                    if (flagSearch == true) {
                      searchSeat();
                      SeatItem s = SeatItem(
                          seatNumber: int.parse(searchController.text),
                          searchedSeat: searchedSeat,
                          flag: 1);
                      String birthType = s.getBerthType(searchedSeat);
                      showSnackBar(context,
                          "Hey! you have been alloted ${birthType} birth.");
                    } else {
                      showSnackBar(context, "Please enter a valid seat no.");
                    }
                  },
                  child: Container(
                    height: screenHeight * 0.08,
                    width: screenWidth * 0.25,
                    decoration: BoxDecoration(
                      color: flagSearch == true ? textColor : Colors.grey,
                      borderRadius: BorderRadius.circular(screenWidth * 0.02),
                    ),
                    child: Center(
                      child: Text(
                        "Find",
                        style: TextStyle(
                            color: background, fontSize: screenWidth * 0.05),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: screenHeight * 0.02),
          Expanded(
            child: ListView.builder(
              itemCount: blockCount,
              controller: scrollController,
              itemBuilder: (context, index) {
                return SeatBlock(
                  onTapSeat: selectSeat,
                  blockNumber: index + 1,
                  seatsPerBlock: seatsPerBlock,
                  searchedSeat: searchedSeat,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void searchSeat() {
    final seatNumber = int.tryParse(searchController.text);
    if (seatNumber != null) {
      setState(() {
        searchedSeat = seatNumber;
      });
      scrollToSeat(seatNumber);
    }
  }

  void scrollToSeat(int seatNumber) {
    final blockIndex = ((seatNumber - 1) / seatsPerBlock).floor();
    final scrollOffset = blockIndex * (20.0 * seatsPerBlock);
    scrollController.animateTo(
      scrollOffset,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  //onTap
  void selectSeat(int seatNumber) {
    setState(() {
      searchedSeat = seatNumber;
    });
    scrollToSeat(seatNumber);
  }
}
