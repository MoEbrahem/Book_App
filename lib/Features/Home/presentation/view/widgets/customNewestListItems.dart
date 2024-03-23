import 'package:book/Features/Home/Data/repos/presentation/manager/newestBooks_cubit/newest_books_cubit.dart';
import 'package:book/Features/Home/presentation/view/widgets/CustomErrorMessage.dart';
import 'package:book/Features/Home/presentation/view/widgets/bestSellerListViewItem.dart';
import 'package:book/Features/Home/presentation/view/widgets/customLoadingIndicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomNewestListItems extends StatelessWidget {
  const CustomNewestListItems({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccess) {
          return ListView.builder(
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: BestSellerListViewItem(
                    book: state.books[index],
                  ),
                );
              });
        } else if (state is NewestBooksfailure) {
          return CustomErrorMessage(
            errmessage: state.errMessage,
          );
        } else {
          return const Center(
            child: CustomLoadingIndicator(),
          );
        }
      },
    );
  }
}
