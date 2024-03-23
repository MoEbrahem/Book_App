import 'package:book/core/styles.dart';
import 'package:flutter/material.dart';

class CustomErrorMessage extends StatelessWidget {
  final String errmessage;
  const CustomErrorMessage({super.key, required this.errmessage});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errmessage,
        textAlign: TextAlign.center,
        style: Styles.textStyle18,
      ),
    );
  }
}
