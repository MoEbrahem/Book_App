// ignore_for_file: file_names

import 'package:book/Features/Home/Data/repos/home_repo_impl.dart';
import 'package:book/core/utils/api_services.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getit = GetIt.instance;
void setUpServiceLocaltor() {
  getit.registerSingleton<ApiServices>(ApiServices(Dio()));
  getit.registerSingleton<Home_Repo_Impl>(
      Home_Repo_Impl(getit.get<ApiServices>()));
}
