// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:book/Features/Home/Data/model/book_model/book_model.dart';
import 'package:book/Features/Home/Data/repos/presentation/manager/similarBook_cubit/similar_book_cubit.dart';
import 'package:flutter/material.dart';

import 'package:book/Features/Home/presentation/view/widgets/book_details_view_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetails extends StatefulWidget {
  final BookModel bookModel;

  const BookDetails({
    Key? key,
    required this.bookModel,
  }) : super(key: key);

  @override
  State<BookDetails> createState() => _BookDetailsState();
}

class _BookDetailsState extends State<BookDetails> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BookDetailsBody(
          bookModel: widget.bookModel,
        ),
      ),
    );
  }

  @override
  void initState() {
    BlocProvider.of<SimilarBookCubit>(context).fetchSimilarBook(
      category: widget.bookModel.volumeInfo.categories![0]
    );
    super.initState();
  }
}
