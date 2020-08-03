import 'package:package_info/package_info.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  String appName = '';
  String packageName = '';
  String version = '';
  String buildNumber = '';
  @override
  void initState() {
    super.initState();
    PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
      appName = packageInfo.appName;
      packageName = packageInfo.packageName;
      version = packageInfo.version;
      buildNumber = packageInfo.buildNumber;

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(color: Colors.black),
        child: Center(
          child: Stack(
            fit: StackFit.expand,
            alignment: Alignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text('This is the Drawer'),
                  RaisedButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Close Drawer'),
                  ),
                ],
              ),
              Positioned(
                  bottom: 0,
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Text("@ $appName",
                            style: TextStyle(color: Colors.white)),
                        Text(packageName,
                            style: TextStyle(color: Colors.white)),
                        Text("$version ($buildNumber)",
                            style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
