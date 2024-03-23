import 'package:book/Features/Home/Data/model/book_model/book_model.dart';
import 'package:book/Features/Home/presentation/view/widgets/BookAction_Button.dart';
import 'package:book/Features/Home/presentation/view/widgets/CustomBookImage.dart';
import 'package:book/Features/Home/presentation/view/widgets/CustombookDetailsAppBar.dart';
import 'package:book/Features/Home/presentation/view/widgets/bookRating.dart';
import 'package:book/core/styles.dart';
import 'package:flutter/material.dart';

class BooksDetailsSection extends StatelessWidget {
  final BookModel bookModel;
  const BooksDetailsSection({super.key, required this.bookModel});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        const CustomBookDetailsAppBar(),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.2,
          ),
          child: CustomBookImage(
            imageUrl: bookModel.volumeInfo.imageLinks?.thumbnail ?? '',
          ),
        ),
        const SizedBox(
          height: 43,
        ),
        Text(
          bookModel.volumeInfo.title ?? '',
          textAlign: TextAlign.center,
          style: Styles.textStyle30.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        Opacity(
          opacity: 0.7,
          child: Text(
            bookModel.volumeInfo.authors?[0] ?? '',
            style: Styles.textStyle18.copyWith(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
         BookRating(
          rating: bookModel.volumeInfo.ratingsCount ?? 0,
          count: bookModel.volumeInfo.ratingsCount ?? 0,
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        const SizedBox(
          height: 37,
        ),
       BooksAction(bookModel: bookModel),
      ],
    );
  }
}
