import 'package:flutter/material.dart';
import 'package:portfolio/constants/fonts.dart';

class OptionButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const OptionButton({Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.white
        )
      ),
      
     
      child: InkWell(
        
        onTap: onPressed,
        child: Text(text, style: bodyTextStyle.copyWith(
          fontSize: 16,
        ),),
      ),
    );
  }
}
