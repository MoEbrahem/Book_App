import 'package:book/Features/Home/Data/model/book_model/book_model.dart';
import 'package:book/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future< Either < Failure , List<BookModel> > > fetchNewestBooks();
  Future< Either < Failure , List<BookModel> > > fetchFeatchedBooks();
  // Future< Either < Failure , List<BookModel> > > fetchSearchedBooks();

}
