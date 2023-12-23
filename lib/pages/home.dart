import 'package:flutter/material.dart';
import 'package:portfolio/contants/colors.dart';
import 'package:portfolio/contants/fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            
            Text("Hi. I am Harkirat.", style: headlineStyle,),
            Text("A Developer.", style: headlineStyle,)
          ],
        ),
      )
    );
  }
}
