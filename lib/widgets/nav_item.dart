import 'package:flutter/material.dart';
import 'package:portfolio/constants/fonts.dart';
import 'package:portfolio/routes/routes.dart';

class NavItem extends StatelessWidget {
  const NavItem(
      {super.key,
      required this.title,
      required this.routeName,
      required this.selected,
      required this.onHighlight});

  final String title;
  final String routeName;

  final bool selected;
  final Function onHighlight;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          navKey.currentState!.pushNamed(routeName);
          onHighlight(routeName);
        },
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: selected
                ? Colors.white10
                : Colors.transparent, // Set your desired background color
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            title,
            style: bodyTextStyle.copyWith(
                fontSize: size.width > 600
                    ? 16
                    : (size.width / 600) *
                        20 *
                        0.7), // Adjust text color as needed
          ),
        ),
      ),
    );
  }
}
