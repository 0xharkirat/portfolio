import 'package:flutter/material.dart';
import 'package:portfolio/constants/fonts.dart';
import 'package:portfolio/routes/routes.dart';
import 'dart:js' as js;
import 'package:url_launcher/url_launcher.dart';

class NavItem extends StatelessWidget {
  const NavItem({super.key, required this.title, required this.routeName});

  final String title;
  final String routeName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: (){
            js.context.callMethod('open', [routeName]);
          },
          // onTap: () {
          //   // navKey.currentState!.pushNamed(routeName);

            
          // },
          
          child: Text(
            title,
            style: bodyTextStyle, // Adjust text color as needed
          ),
        ),
      ),
    );
  }

  Future<void> _launchUrl() async {
  if (!await launchUrl(Uri.parse(routeName))) {
    throw Exception('Could not launch $routeName');
  }
}
}
