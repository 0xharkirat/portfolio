import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/provider/font_provider.dart';

class OptionButton extends ConsumerWidget {
  final String text;
  final VoidCallback onPressed;

  const OptionButton({Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentFontGroup = ref.watch(fontProvider);
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
        child: Text(text, style: Theme.of(context)
                      .textTheme.bodyLarge!.copyWith(
          fontSize: 16,
          fontFamily: currentFontGroup['body'],
        ),),
      ),
    );
  }
}
