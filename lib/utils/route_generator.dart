import 'package:naijagospel/screen/home/home.dart';
import 'package:naijagospel/screen/loading.dart';
import 'package:flutter/material.dart';
import 'package:naijagospel/screen/single_post/single_post_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    var arg = settings.arguments;
    switch (settings.name) {
      case '/home':
        return customPageRouteBuilder(HomeScreen());
        break;
      case '/post':
        return customPageRouteBuilder(SinglePostScreen(post: arg));
        break;
      default:
        return customPageRouteBuilder(LoadingScreen());
    }
  }
}

PageRouteBuilder customPageRouteBuilder(Widget widget) {
  return PageRouteBuilder(
    transitionDuration: Duration(milliseconds: 700),
    transitionsBuilder: (context, animation, secAnimation, child) {
      var begin = Offset(1.0, 0.0);
      var end = Offset.zero;
      var curve = Curves.ease;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
    pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secAnimation) =>
        widget,
  );
}
