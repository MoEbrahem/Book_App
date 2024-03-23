// ignore_for_file: file_names

import 'package:book/Features/Home/Data/repos/presentation/manager/similarBook_cubit/similar_book_cubit.dart';
import 'package:book/Features/Home/presentation/view/widgets/CustomBookImage.dart';
import 'package:book/Features/Home/presentation/view/widgets/CustomErrorMessage.dart';
import 'package:book/Features/Home/presentation/view/widgets/customLoadingIndicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarBooksListView extends StatelessWidget {
  
  const SimilarBooksListView({super.key,});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBookCubit, SimilarBookState>(
      builder: (context, state) {
        
        if (state is SimilarBookSuccess) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.15,
          child: ListView.builder(
            itemCount: state.bookModel.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: CustomBookImage(
                  imageUrl: state.bookModel[index].volumeInfo.imageLinks?.thumbnail ?? '',
                ),
              );
            },
          ),
        );
        }else if (state is SimilarBookFailure){
          return CustomErrorMessage(errmessage: state.errMessage);
        } else{
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
