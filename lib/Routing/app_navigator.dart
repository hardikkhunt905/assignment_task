import 'package:flutter/material.dart';

class AppNavigator{

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static Future push<T>(
      String route, {
        Object? arguments,
      }) {
    return state.pushNamed(route, arguments: arguments);
  }

  static Future replaceWith<T>(
      String route, {
        Map<String, dynamic>? arguments,
      }) {
    return state.pushReplacementNamed(route, arguments: arguments);
  }

  static void popUntil<T>(String route) => state.popUntil(ModalRoute.withName(route));

  static void pop() {
    if (state.canPop()) {
      state.pop();
    }
  }

  static String currentRoute(context) => ModalRoute.of(context)!.settings.name!;

  static NavigatorState get state => navigatorKey.currentState!;
}