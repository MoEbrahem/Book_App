// ignore_for_file: file_names

import 'package:book/Features/Constants.dart';
import 'package:book/Features/Home/Data/model/book_model/book_model.dart';
import 'package:book/Features/Home/presentation/view/widgets/CustomBookImage.dart';
import 'package:book/Features/Home/presentation/view/widgets/bookRating.dart';
import 'package:book/core/styles.dart';
import 'package:book/core/utils/AppRouter.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BestSellerListViewItem extends StatelessWidget {
  final BookModel book;
  const BestSellerListViewItem({
    super.key,
    required this.book,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(
          AppRouter.kBookDetailsview,
          extra: book,
          
        );
      },
      child: SizedBox(
        height: 125,
        child: Row(
          children: [
            CustomBookImage(
              imageUrl: book.volumeInfo.imageLinks?.thumbnail ?? '',
            ),
            const SizedBox(
              width: 30,
            ),
            Expanded(
              child: Column(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text(
                      book.volumeInfo.title!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.textStyle20.copyWith(
                          fontFamily: kGTSectraFine,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    book.volumeInfo.authors![0],
                    style: Styles.textStyle14,
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Free',
                        style: Styles.textStyle20.copyWith(
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      BookRating(
                        rating:book.volumeInfo.averageRating ?? 0,
                        count: book.volumeInfo.ratingsCount  ?? 0,
                        )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
