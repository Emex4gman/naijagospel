import 'package:flutter/material.dart';

class CustomBanner extends StatelessWidget {
  final String title;
  CustomBanner(this.title) : assert(title != null);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            title,
            style:
                TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
