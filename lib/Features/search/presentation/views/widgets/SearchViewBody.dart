import 'package:book/Features/Home/Data/model/book_model/book_model.dart';
import 'package:book/Features/Home/presentation/view/widgets/CustomErrorMessage.dart';
import 'package:book/Features/Home/presentation/view/widgets/FeaturedBooksListView.dart';
import 'package:book/Features/Home/presentation/view/widgets/customLoadingIndicator.dart';
import 'package:book/Features/search/Data/repos/manager/cubit/search_cubit.dart';
import 'package:book/Features/search/presentation/views/widgets/SearchedListView.dart';
import 'package:book/core/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({
    super.key,
  });

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  late TextEditingController searchTextController;
  List<BookModel> searchedForcharList = [];
  bool isSearching = false;

  @override
  void initState() {
    searchTextController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    searchTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchSuccess) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                TextField(
                  controller: searchTextController,
                  onChanged: (searchedChar) {
                    SearchingWidget(searchedChar, state);
                  },
                  decoration: InputDecoration(
                    enabledBorder: buildOutlineInputBorder(),
                    focusedBorder: buildOutlineInputBorder(),
                    hintText: "Search",
                    suffixIcon: Opacity(
                      opacity: 0.8,
                      child: isSearching == true
                          ? const Icon(
                              FontAwesomeIcons.magnifyingGlass,
                              size: 22,
                            )
                          : IconButton(
                              onPressed: () {
                                isSearching == false;
                                searchTextController.clear();
                                setState(() {});
                              },
                              icon: const Icon(
                                Icons.close,
                                size: 22,
                              ),
                            ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  "Search Result",
                  style: Styles.textStyle18,
                ),
                const SizedBox(
                  height: 16,
                ),
                Expanded(
                  // ignore: unnecessary_null_comparison
                  child: searchedForcharList.isEmpty
                      ? const FeaturedBooksListView()
                      : SearchresultListView(
                          Searchedbooks: searchedForcharList,
                        ),
                ),
              ],
            ),
          );
        } else if (state is SearchFailed) {
          return CustomErrorMessage(
            errmessage: state.errMessage,
          );
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }

  SearchingWidget(String searchedChar, state) {
    isSearching = true;
    searchedForcharList = state.books
        .where((element) =>
            element.volumeInfo.title!.toLowerCase().startsWith(searchedChar))
        .toList();
    setState(() {});
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white),
      borderRadius: BorderRadius.circular(12),
    );
  }
}
