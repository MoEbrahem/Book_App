// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

void CustomSnackBar(context, url){
  ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Cannot Launch $url"),
        ),
      );
}