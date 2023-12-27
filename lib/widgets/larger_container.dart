import 'package:flutter/material.dart';
import 'package:portfolio/constants/fonts.dart';

class LargerContainer extends StatelessWidget {
  const LargerContainer({super.key, required this.number});
  final int number;

  @override
  Widget build(BuildContext context) {
    
    return Container(
      
      height: 400,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white38,),
        color: Colors.black54,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Center(child: Text(number.toString(), style: bodyTextStyle,)),
    );
    
  }
}
