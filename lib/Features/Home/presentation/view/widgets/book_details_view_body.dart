// ignore_for_file: non_constant_identifier_names

import 'package:book/Features/Home/Data/model/book_model/book_model.dart';
import 'package:book/Features/Home/presentation/view/widgets/booksDetails_Section.dart';
import 'package:book/Features/Home/presentation/view/widgets/similarBooksSection.dart';
import 'package:flutter/material.dart';

class BookDetailsBody extends StatelessWidget {
  final BookModel bookModel;
  const BookDetailsBody({
    super.key,
    required this.bookModel,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
            ),
            child: Column(
              children: [
                BooksDetailsSection(
                  bookModel: bookModel,
                ),
                const Expanded(
                  child: SizedBox(
                    height: 50,
                  ),
                ),
                const SimilarBooksSection(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
