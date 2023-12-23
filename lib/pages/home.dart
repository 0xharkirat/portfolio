import 'package:flutter/material.dart';
import 'package:portfolio/contants/colors.dart';
import 'package:portfolio/contants/fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: _heroSection()
    );
  }

  _heroSection(){
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            
            Text("Hi. I'm Harkirat.", style: headlineStyle,),
            Text("A Developer.", style: headlineStyle,),
            SizedBox(height: 14,),
            Text("I am learning & creating better technologies for the greater good of Humanity.", style: subTitleStyle,)
          ],
        ),
      );
  }
}
