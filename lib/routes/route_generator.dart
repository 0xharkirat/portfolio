import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio/pages/about.dart';
import 'package:portfolio/pages/error.dart';
import 'package:portfolio/pages/home.dart';
import 'package:portfolio/pages/project.dart';
import 'package:portfolio/routes/routes.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case routeHome:
        changeAppName("Home");
        return createRoute(const HomePage(), settings);

      case routeAbout:
        changeAppName("About");
        return createRoute(const AboutPage(), settings);
      case routeProjects:
        changeAppName("Projects");
        return createRoute(const ProjectPage(), settings);
      default:
        return createRoute(const ErrorPage(), settings);
    }
  }

  static createRoute(Widget route, RouteSettings settings) {
    return PageRouteBuilder(
      settings: settings,
      transitionDuration: const Duration(milliseconds: 690),
      pageBuilder: (context, animation, secondaryAnimation) => route,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: CurveTween(curve: Curves.easeInOutQuad).animate(animation),
          child: child,
        );
      },
    );
  }

  static void changeAppName(String name) {
    String title = "Harkirat Singh • $name";
    SystemChrome.setApplicationSwitcherDescription(
      ApplicationSwitcherDescription(
        label: title,
        primaryColor: 0xffaaaaaa, // This line is required
      ),
    );
  }
}
