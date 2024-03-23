import 'package:bloc/bloc.dart';
import 'package:book/Features/Home/Data/model/book_model/book_model.dart';
import 'package:book/Features/Home/Data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final HomeRepo homeRepo;
  SearchCubit(this.homeRepo) : super(SearchInitial());

  Future<void> fetchSearchedBooks() async {
    emit(SearchLoading());
    var result = await homeRepo.fetchFeatchedBooks();
    return result.fold(
      (failure) {
        emit(SearchFailed(failure.errormsg));
      },
      (books) {
        emit(SearchSuccess(books));
      },
    );
  }
}
