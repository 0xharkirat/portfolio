import 'package:flutter/material.dart';
import 'package:portfolio/constants/fonts.dart';
import 'package:portfolio/pages/route_view.dart';
import 'package:portfolio/routes/route_generator.dart';
import 'package:portfolio/routes/routes.dart';

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (_, child) => RouteView(
        child: child!,
      ),
      darkTheme: darkTheme,
      initialRoute: routeHome,
      navigatorKey: navKey,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
