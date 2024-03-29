import 'package:flutter/material.dart';
import 'package:rick_and_morty/layers/presenation/all_cast/cast.dart';
import 'package:rick_and_morty/layers/presenation/cast_detail/cast_detail.dart';
import 'package:rick_and_morty/layers/presenation/favourite_cast/favourite_cast.dart';
import 'package:rick_and_morty/layers/presenation/home/home.dart';
import 'package:rick_and_morty/layers/presenation/navigation/navgation.dart';

class Routes {
  static const String home = "/home";
  static const String bottom = "/bottom";
  static const String details = "/details";
  static const String cast = "/cast";
  static const String favourite = "/favourite";
}

final class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      case Routes.favourite:
        return MaterialPageRoute(
          builder: (context) => const FavouriteCharacter(),
        );
      case Routes.bottom:
        return MaterialPageRoute(
          builder: (context) => const NavigationScreen(),
        );
      case Routes.cast:
        return MaterialPageRoute(
          builder: (context) => AllCharacterPage(),
        );
      case Routes.details:
        final character = settings.arguments as Map;
        return MaterialPageRoute(
          builder: (context) => CartoonDetailsScreen(
            character: character["character"],
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
    }
  }
}
