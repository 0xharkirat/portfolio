import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:portfolio/constants/fonts.dart';
import 'package:portfolio/provider/contact_provider.dart';
import 'package:portfolio/routes/routes.dart';
import 'package:portfolio/widgets/nav_item.dart';

class NavigationBarWeb extends StatefulWidget {
  const NavigationBarWeb({super.key});

  @override
  State<NavigationBarWeb> createState() => _NavigationBarWebState();
}

class _NavigationBarWebState extends State<NavigationBarWeb> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width > 767 ? 450 : size.width * 0.7,
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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        children: [
          NavItem(
            title: "Home",
            routeName: routeHome,
            selected: index == 0,
            onHighlight: onHighlight,
          ),
          NavItem(
            title: "About",
            routeName: routeAbout,
            selected: index == 1,
            onHighlight: onHighlight,
          ),
          NavItem(
            title: "Projects",
            routeName: routeProjects,
            selected: index == 2,
            onHighlight: onHighlight,
          ),
          _contactNav(size)
        ],
      ),
    );
  }

  Widget _contactNav(Size size) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: InkWell(
            mouseCursor: SystemMouseCursors.click,
            onTap: () {
              ref.read(contactProvider.notifier).toggleContact(context);
            },
            child: Text(
              "Contact",
              style: bodyTextStyle.copyWith(
                  fontSize:
                      size.width > 600 ? 16 : (size.width / 600) * 20 * 0.7),
            ),
          ),
        );
      },
    );
  }

  void onHighlight(String route) {
    switch (route) {
      case routeHome:
        changeHighlight(0);
        break;
      case routeAbout:
        changeHighlight(1);
        break;
      case routeProjects:
        changeHighlight(2);
        break;
    }
  }

  void changeHighlight(int newIndex) {
    setState(() {
      index = newIndex;
    });
  }
}
