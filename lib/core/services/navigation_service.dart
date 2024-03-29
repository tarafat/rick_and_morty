import 'package:flutter/material.dart';

final class NavigationService {
  NavigationService._internal();

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static Future<dynamic> navigateTo(String routeName) =>
      navigatorKey.currentState!.pushNamed(routeName);

  static Future<dynamic> navigateToReplacement(String routeName) =>
      navigatorKey.currentState!.pushReplacementNamed(routeName);

  static Future<dynamic> popAndReplace(String routeName) async {
    return await navigatorKey.currentState!.popAndPushNamed(routeName);
  }

  static Future<dynamic> navigateToWithArgs(
    String routeName,
    Map<String, dynamic>? map,
  ) =>
      navigatorKey.currentState!.pushNamed(routeName, arguments: map);

  static Future<dynamic> popAndReplaceWihArgs(
          String routeName, Map<String, dynamic>? map) =>
      navigatorKey.currentState!.popAndPushNamed(routeName, arguments: map);

  static Future<dynamic> navigateToWithObject(
    String routeName,
    Object? obj,
  ) =>
      navigatorKey.currentState!.pushNamed(routeName, arguments: obj);

  static get goBack => navigatorKey.currentState!.pop();

  static get goBeBack => navigatorKey.currentState!.canPop();

  static get context => navigatorKey.currentContext;
}
