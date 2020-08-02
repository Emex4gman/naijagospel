import 'package:flutter/material.dart';
import 'package:naijagospel/components/custom_header.dart';
import 'package:naijagospel/components/default_scafold.dart';
import 'package:naijagospel/models/post_model.dart';

class SinglePostScreen extends StatefulWidget {
  final PostModel post;
  SinglePostScreen({Key key, this.post})
      : assert(post != null),
        super(key: key);
  @override
  _SinglePostScreenState createState() => _SinglePostScreenState();
}

class _SinglePostScreenState extends State<SinglePostScreen> {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return DefaultScaffold(
      body: SingleChildScrollView(
        child: Container(
          height: _height,
          child: Column(
            children: <Widget>[
              CustomHeader(),
            ],
          ),
        ),
      ),
    );
  }
}
