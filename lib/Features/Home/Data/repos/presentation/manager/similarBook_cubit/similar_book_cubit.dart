import 'package:bloc/bloc.dart';
import 'package:book/Features/Home/Data/model/book_model/book_model.dart';
import 'package:book/Features/Home/Data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'similar_book_state.dart';

class SimilarBookCubit extends Cubit<SimilarBookState> {
  SimilarBookCubit(this.homeRepo) : super(SimilarBookInitial());
  final HomeRepo homeRepo;
  Future<void> fetchSimilarBook({required String category}) async {
    emit(SimilarBookLoading());
    var result = await homeRepo.fetchFeatchedBooks();
    return result.fold(
      (failure) {
        emit(SimilarBookFailure(failure.errormsg));
      },
      (book) {
        emit(SimilarBookSuccess(book));
      },
    );
  }
}
