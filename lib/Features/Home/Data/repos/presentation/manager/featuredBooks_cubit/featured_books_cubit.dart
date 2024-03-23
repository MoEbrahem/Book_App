import 'package:bloc/bloc.dart';
import 'package:book/Features/Home/Data/model/book_model/book_model.dart';
import 'package:book/Features/Home/Data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.homeRepo) : super(FeaturedBooksInitial());

  final HomeRepo homeRepo;

  Future<void> fetchFetchedBooks() async {
    emit(FeaturedBooksLoading());
    var result = await homeRepo.fetchFeatchedBooks();
    return result.fold(
      (failure) {
        emit(FeaturedBooksFailure(failure.errormsg));
      },
      (books) {
        emit(FeaturedBooksSuccess(books));
      },
    );
  }
}
