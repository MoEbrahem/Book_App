// ignore_for_file: file_names

import 'package:book/Features/Home/Data/repos/presentation/manager/featuredBooks_cubit/featured_books_cubit.dart';
import 'package:book/Features/Home/presentation/view/widgets/CustomErrorMessage.dart';
import 'package:book/Features/Home/presentation/view/widgets/customLoadingIndicator.dart';
import 'package:book/core/utils/AppRouter.dart';
import 'package:flutter/material.dart';

import 'package:book/Features/Home/presentation/view/widgets/CustomBookImage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: state.books.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: GestureDetector(
                    onTap: () {
                      GoRouter.of(context)
                          .push(
                            AppRouter.kBookDetailsview,
                            extra: state.books[index]
                            );
                    },
                    child: CustomBookImage(
                      imageUrl:
                          state.books[index].volumeInfo.imageLinks?.thumbnail ??
                              '',
                    ),
                  ),
                );
              },
            ),
          );
        } else if (state is FeaturedBooksFailure) {
          return CustomErrorMessage(errmessage: state.errMessage);
        } else {
          return const Center(child: CustomLoadingIndicator());
        }
      },
    );
  }
}
