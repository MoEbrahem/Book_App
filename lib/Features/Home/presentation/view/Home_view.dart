// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'package:book/Features/Home/presentation/view/widgets/HomeViewBody.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomeViewBody(),
    );
  }
}
