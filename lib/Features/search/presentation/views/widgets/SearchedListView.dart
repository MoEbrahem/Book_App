import 'package:book/Features/Home/Data/model/book_model/book_model.dart';
import 'package:book/Features/Home/presentation/view/widgets/bestSellerListViewItem.dart';
import 'package:flutter/material.dart';

class SearchresultListView extends StatelessWidget {
  final List<BookModel> Searchedbooks;
  const SearchresultListView({super.key, required this.Searchedbooks});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: Searchedbooks.length,
      itemBuilder: (context, index) {
        return BestSellerListViewItem(book: Searchedbooks[index],);
      },
    );
  }
}