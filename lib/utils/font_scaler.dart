import 'package:flutter/material.dart';

class FontScaler {
  num shortSide;
  FontScaler(BuildContext context) {
    shortSide = MediaQuery.of(context).size.shortestSide;
  }
  num sp(double percentage) {
    return ((shortSide) * (percentage / 1000)).ceil().toDouble();
  }
}
