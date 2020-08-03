import 'package:flutter/material.dart';
import 'package:naijagospel/utils/font_scaler.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final fontScaler = FontScaler(context);
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Container(
      // height: _height * 0.15,
      width: _width,
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        children: <Widget>[
          Image.asset(
            'assets/nglogo.png',
            height: 40.0,
          ),
          SizedBox(height: 5.0),
          Text(
            "NAIJAGOSPEL",
            style: TextStyle(
                fontSize: 18.0,
                fontFamily: "Felix Titling",
                fontWeight: FontWeight.bold,
                color: Color(0xff0c7ea2)),
          ),
          Text(
              'COPYRIGHT(C) 2013 - ${new DateTime.now().year} NaijaGospel Entertainment',
              style:
                  TextStyle(color: Colors.black, fontSize: fontScaler.sp(20))),
          Text('RC Number: 2940160',
              style:
                  TextStyle(color: Colors.black, fontSize: fontScaler.sp(20)))
        ],
      ),
    );
  }
}
