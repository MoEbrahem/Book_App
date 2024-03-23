// ignore_for_file: file_names

import 'package:book/Features/Home/Data/model/book_model/book_model.dart';
import 'package:book/core/utils/functions/CustomUrllauncher.dart';
import 'package:book/core/widgets/customButton.dart';
import 'package:flutter/material.dart';

class BooksAction extends StatelessWidget {
  final BookModel bookModel;
  const BooksAction({super.key, required this.bookModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          const Expanded(
            child: CustomButton(
              backgroundColor: Colors.white,
              textColor: Colors.black,
              textButton: 'Free',
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
            ),
          ),
          Expanded(
            child: CustomButton(
              onPressed: () {
                LaunchCustomUrl(context, bookModel.volumeInfo.previewLink);
              },
              fontSize: 16,
              backgroundColor: const Color(0xffEF8262),
              textColor: Colors.white,
              textButton: getText(bookModel),
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

String getText(BookModel bookModel) {
  if (bookModel.volumeInfo.previewLink != null) {
    return 'preview';
  } else {
    return 'Not Available';
  }
}
