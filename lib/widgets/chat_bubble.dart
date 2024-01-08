import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/provider/font_provider.dart';

class ChatBubble extends ConsumerWidget {
  final String message;
  final bool isBot;

  const ChatBubble({Key? key, required this.message, required this.isBot})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentFontGroup = ref.watch(fontProvider);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: isBot ? Colors.white38 : Colors.white60,
      ),
      child: Text(
        message,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontSize: 16,
              color: isBot ? kTextColor : const Color.fromARGB(255, 18, 18, 18),
              fontFamily: currentFontGroup['body'],
            ),
      ),
    ).animate();
  }
}
