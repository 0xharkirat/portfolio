import 'package:flutter/material.dart';
import 'package:portfolio/pages/about.dart';
import 'package:portfolio/pages/error.dart';
import 'package:portfolio/pages/home.dart';
import 'package:portfolio/pages/project.dart';
import 'package:portfolio/routes/routes.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case routeHome:
        return createRoute(const HomePage());

      case routeAbout:
        return createRoute(const AboutPage());
      case routeProjects:
        return createRoute(const ProjectPage());
      default:
        return createRoute(const ErrorPage());
    }
  }

  static createRoute(Widget route) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => route,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      
      return FadeTransition(
        opacity: CurveTween(curve: Curves.linear).animate(animation),
        child: child,
      );
    },
  );
}
}
