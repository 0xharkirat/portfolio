import 'package:flutter/material.dart';
import 'package:portfolio/routes/routes.dart';

class NavItem extends StatelessWidget {
  const NavItem(
      {super.key,
      required this.title,
      required this.routeName,
      required this.selected,
      required this.onHighlight, required this.message});

  final IconData title;
  final String routeName;
  final String message;

  final bool selected;
  final Function onHighlight;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: selected
            ? Colors.white10
            : Colors.transparent, // Set your desired background color
        
      ),
      child: IconButton(
        splashRadius: 1,
        mouseCursor: SystemMouseCursors.click,
        onPressed: () {
          navKey.currentState!.pushNamed(routeName);
      onHighlight(routeName);
          
        },
        icon: Icon(title, color: Colors.white,),
      
         // Adjust text color as needed
      ),
    );
  }
}
