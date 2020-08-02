import 'package:flutter/material.dart';

class CustomHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
              image: AssetImage('assets/header-logo.png'), fit: BoxFit.cover)),
      height: _height * 0.15,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Icon(Icons.menu),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
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
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "it's all about you",
                  style: TextStyle(
                    color: Colors.greenAccent[700],
                    fontFamily: "Mistral",
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Icon(Icons.search)
          ],
        ),
      ),
    );
  }
}
