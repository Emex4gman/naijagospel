import 'package:flutter/material.dart';

class ErrorUi extends StatelessWidget {
  final String message;
  ErrorUi({@required this.message});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text(
          message,
          style: TextStyle(backgroundColor: Colors.black),
        ),
      ),
    );
  }
}
