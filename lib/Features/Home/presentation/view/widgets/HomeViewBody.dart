// ignore_for_file: file_names

import 'package:book/Features/Home/presentation/view/widgets/customNewestListItems.dart';
import 'package:flutter/material.dart';
import 'package:book/Features/Home/presentation/view/widgets/FeaturedBooksListView.dart';
import 'package:book/Features/Home/presentation/view/widgets/customAppBar.dart';
import 'package:book/core/styles.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(),
              FeaturedBooksListView(),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  "Newest Books",
                  style: Styles.textStyle18,
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        SliverFillRemaining(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 30,
            ),
            child: CustomNewestListItems(),
          ),
        )
      ],
    );
  }
}
