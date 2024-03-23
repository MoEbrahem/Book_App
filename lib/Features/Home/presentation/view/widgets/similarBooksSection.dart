// ignore_for_file: file_names

import 'package:book/Features/Home/presentation/view/widgets/similarBooksList.dart';
import 'package:book/core/styles.dart';
import 'package:flutter/material.dart';

class SimilarBooksSection extends StatelessWidget {
  
  const SimilarBooksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "You can also like",
          style: Styles.textStyle14.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SimilarBooksListView(),
      ],
    );
  }
}
