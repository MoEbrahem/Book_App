// ignore_for_file: camel_case_types

import 'package:book/Features/Home/Data/model/book_model/book_model.dart';
import 'package:book/Features/Home/Data/repos/home_repo.dart';
import 'package:book/core/errors/failure.dart';
import 'package:book/core/utils/api_services.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class Home_Repo_Impl implements HomeRepo {
  final ApiServices apiServices;

  Home_Repo_Impl(this.apiServices);

  @override
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks() async {
    try {
      var data = await apiServices.get(
          endpoint:
              'volumes?Filtering=free-ebooks&Sorting=newest&q=computer science');
      List<BookModel> books = [];
      for (var item in data['items']) {
        try {
          books.add(item);
        }catch (e) {
          print(item);
        }
      }
      return Right(books);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(
        ServerFailure(e.toString()),
      );
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeatchedBooks() async {
    try {
      var data = await apiServices.get(
          endpoint: 'volumes?Filtering=free-ebooks&q=subject:Programming');

      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return Right(books);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(
        ServerFailure(e.toString()),
      );
    }
  }
  
  
}
