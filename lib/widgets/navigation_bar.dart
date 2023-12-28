import 'package:flutter/material.dart';

import 'package:portfolio/constants/fonts.dart';
import 'package:portfolio/routes/routes.dart';
import 'package:portfolio/widgets/nav_item.dart';

class NavigationBarWeb extends StatelessWidget {
  const NavigationBarWeb({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width > 767? 450: size.width* 0.7,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.black12,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3), // Shadow color
            spreadRadius: 2, // How far the shadow should spread
            blurRadius: 5, // How blurry the shadow should be
            offset: const Offset(0, 2), // Offset of the shadow
          ),
        ],
      ),
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const NavItem(
            title: "Home",
            routeName: routeHome,
          ),
          const NavItem(
            title: "About",
            routeName: routeAbout,
          ),
          const NavItem(
            title: "Projects",
            routeName: routeProjects,
          ),
          _contactNav(size)
        ],
      ),
    );
  }

  Widget _contactNav(Size size) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: GestureDetector(
        onTap: () {},
        child: Text(
          "Contact",
          style: bodyTextStyle.copyWith(
                fontSize: size.width > 600
                    ? 20
                    : (size.width / 600) *
                        20 *
                        0.7), 
        ),
      ),
    );
  }
}
