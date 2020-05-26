import 'package:flutter/material.dart';

class DefaultScaffold extends StatelessWidget {
  final Widget body;
  DefaultScaffold({Key key, this.body}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(child: body),
    );
  }
}
