import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Navigation {
  static void navigateToPage(
      BuildContext context, Widget navigateTo, String name) {
    Navigator.push(
      context,
      PageTransition(
          type: PageTransitionType.rightToLeft,
          child: navigateTo,
          settings: RouteSettings(name: name)),
    );
  }

  static void removeAllRoutes(BuildContext context, Widget navigateTo) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => navigateTo),
        (Route<dynamic> route) => false);
  }

  static pop(BuildContext context) {
    Navigator.of(context).pop();
  }
}
