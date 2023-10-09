import 'package:flutter/material.dart';

class NavigationService {
  GlobalKey<NavigatorState>? navigationKey;

  static NavigationService instance = NavigationService();

  NavigationService() {
    navigationKey = GlobalKey<NavigatorState>();
  }

  Future<dynamic> navigateToReplacement(String rn) {
    return navigationKey!.currentState!.pushReplacementNamed(rn);
  }

  Future<dynamic> navigateTo(String rn) {
    return navigationKey!.currentState!.pushNamed(rn);
  }

  Future<dynamic> navigateToRoute(MaterialPageRoute rn) {
    return navigationKey!.currentState!.push(rn);
  }

  goBack() {
    return navigationKey!.currentState!.pop();
  }
}

//
//
// void navigatorTo(context, Widget widget) {
//   Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
// }