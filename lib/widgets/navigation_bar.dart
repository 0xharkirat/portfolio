import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/constants/colors.dart';
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
      decoration: BoxDecoration(
          color: kNewBackgroundcolor,
          border: Border.all(
               color: const Color.fromARGB(127, 255, 255, 255))),
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        
        children: [
          NavItem(
            title: Icons.home_outlined,
            routeName: routeHome,
            selected: index == 0,
            onHighlight: onHighlight,
            message: 'Home',
          ),
          NavItem(
            title: Icons.person_outline,
            routeName: routeAbout,
            selected: index == 1,
            onHighlight: onHighlight,
            message: 'About',
          ),
          NavItem(
            title: Icons.work_outline,
            routeName: routeProjects,
            selected: index == 2,
            onHighlight: onHighlight,
            message: 'Projects',
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
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: IconButton(
            splashRadius: 1,
            mouseCursor: SystemMouseCursors.click,
            icon: const Icon(
              Icons.email_outlined,
              color: Colors.white,
            ),
            onPressed: () {
              ref.read(contactProvider.notifier).toggleContact(context);
            },
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
