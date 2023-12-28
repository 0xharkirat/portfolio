import 'package:flutter/material.dart';
import 'package:portfolio/constants/fonts.dart';
import 'package:portfolio/routes/routes.dart';

class NavItem extends StatelessWidget {
  const NavItem({super.key, required this.title, required this.routeName});

  final String title;
  final String routeName;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {
            navKey.currentState!.pushNamed(routeName);
          },
          child: Text(
            title,
            style: bodyTextStyle.copyWith(
                fontSize: size.width > 600
                    ? 20
                    : (size.width / 600) *
                        20 *
                        0.7), // Adjust text color as needed
          ),
        ),
      ),
    );
  }
}
