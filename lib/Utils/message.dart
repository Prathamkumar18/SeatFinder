import 'package:flutter/material.dart';

showSnackBar(BuildContext context, String text, int flag) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Center(child: Text(text)),
    elevation: 5,
    duration: Duration(milliseconds: 1000),
    backgroundColor: (flag == 1) ? Colors.green : Colors.red,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20))),
  ));
}
