import 'package:naijagospel/screen/loading.dart';
import 'package:naijagospel/service/state_manager.dart';
import 'package:naijagospel/utils/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

final Map<int, Color> color = {
  50: Color(0xFF176628),
  100: Color(0xFF176628),
  200: Color(0xFF176628),
  300: Color(0xFF176628),
  400: Color(0xFF176628),
  500: Color(0xFF176628),
  600: Color(0xFF176628),
  700: Color(0xFF176628),
  800: Color(0xFF176628),
  900: Color(0xFF176628),
};

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<StateManager>(
      create: (context) => StateManager(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Naijagospel',
        theme: ThemeData(
          fontFamily: 'Cambria',
          primaryColor: Colors.white,
          textTheme: TextTheme(bodyText2: TextStyle(color: Colors.white)),
          iconTheme: IconThemeData(color: Colors.white, size: 30),
          primarySwatch: MaterialColor(0xFF176628, color),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: LoadingScreen(),
        onGenerateRoute: (settings) => RouteGenerator.generateRoute(settings),
      ),
    );
  }
}
