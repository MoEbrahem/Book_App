import 'package:flutter/cupertino.dart';

// ignore: camel_case_types
class Sliding_Text extends StatelessWidget {
  // ignore: non_constant_identifier_names
  const Sliding_Text(
      {super.key, required this.SlidingAnimation, required this.AnimatedText});

  // ignore: non_constant_identifier_names
  final Animation<Offset> SlidingAnimation;
  // ignore: non_constant_identifier_names
  final String AnimatedText;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: SlidingAnimation,
        builder: (context, _) {
          return SlideTransition(
            position: SlidingAnimation,
            child: Text(
              AnimatedText,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          );
        });
  }
}
