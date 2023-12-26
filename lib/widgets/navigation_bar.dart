

import 'package:flutter/material.dart';
import 'package:portfolio/constants/fonts.dart';
import 'package:portfolio/routes/routes.dart';
import 'package:portfolio/widgets/nav_item.dart';

class NavigationBarWeb extends StatelessWidget {
  const NavigationBarWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white12,
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
        mainAxisSize: MainAxisSize.min,
        children: [
          const NavItem(title: "Home", routeName: routeHome,),
          const NavItem(title: "About", routeName: routeAbout,),
          const NavItem(title: "Projects", routeName: routeProjects,),
          _contactNav()
        ],
      ),
    );

    
  }
  Widget _contactNav (){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: GestureDetector(
        onTap: () {
          
        },
        child: Text(
          "Contact",
          style: bodyTextStyle, // Adjust text color as needed
        ),
      ),
    );
      
    }
}