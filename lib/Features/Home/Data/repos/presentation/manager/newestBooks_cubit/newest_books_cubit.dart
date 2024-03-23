import 'package:bloc/bloc.dart';
import 'package:book/Features/Home/Data/model/book_model/book_model.dart';
import 'package:book/Features/Home/Data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';
part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.homeRepo) : super(NewestBooksInitial());
  final HomeRepo homeRepo;

  Future<void> fetchNewestBooks() async {
    emit(NewestBooksLoading());
    var result = await homeRepo.fetchNewestBooks();
    result.fold(
      (failure) {
        emit(NewestBooksfailure(failure.errormsg));
      },
      (books) {
        emit(NewestBooksSuccess(books));
      },
    );
  }
}
