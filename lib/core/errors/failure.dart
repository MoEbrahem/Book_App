// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';

abstract class Failure {
  final String errormsg;
  const Failure(
    this.errormsg,
  );
}

class ServerFailure extends Failure {
  ServerFailure(super.errormsg);
      //========== Factory =============
      
  //   بستخدم الحاجة مرة واحدة بدل مكل مرة اعمل نسخة جديدة منها 

  // factory is Singlton method use a constructor one time and it doesnot changed if a use new one
  // using a factory is important
  // because it promises to return _an_ object of this type
  // but it doesn't promise to make a new one.
 
  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure("connection Timeout with ApiServer");

      case DioExceptionType.sendTimeout:
        return ServerFailure("send Timeout with ApiServer");

      case DioExceptionType.receiveTimeout:
        return ServerFailure("recieve Timeout with ApiServer");

      case DioExceptionType.badCertificate:
        return ServerFailure("bad Certificate with ApiServer");

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          dioError.response!.data,
          dioError.response!.statusCode!,
        );

      case DioExceptionType.cancel:
        return ServerFailure("Request to ApiServer was Canceled");

      case DioExceptionType.connectionError:
        return ServerFailure(
            "No Internet Connection, check you connection then try later");

      case DioExceptionType.unknown:
        if (dioError.message!.contains("SocketException")) {
          return ServerFailure("No Internet Connection");
        }
        return ServerFailure("UnExpected Error, please try later!");
      default:
        return ServerFailure("Opps there was an Error, please try later!");
    }
  }

  factory ServerFailure.fromResponse(dynamic response, int statuscode) 
  {
    if (statuscode == 400 || statuscode == 401 || statuscode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statuscode == 404) {
      return ServerFailure("Your request Not Found, Please try later!");
    } else if (statuscode == 500) {
      return ServerFailure("internal Server Error, please try later!");
    } else {
      return ServerFailure("Opps there was an Error, please try later!");
    }
  }
}
