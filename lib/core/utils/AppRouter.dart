// ignore_for_file: non_constant_identifier_names

import 'package:book/Features/Home/Data/model/book_model/book_model.dart';
import 'package:book/Features/Home/Data/repos/home_repo_impl.dart';
import 'package:book/Features/Home/Data/repos/presentation/manager/similarBook_cubit/similar_book_cubit.dart';
import 'package:book/Features/Home/presentation/view/Home_view.dart';
import 'package:book/Features/Home/presentation/view/book_details_view.dart';
import 'package:book/Features/Splash/presentation/views/Splash_view.dart';
import 'package:book/Features/search/Data/repos/manager/cubit/search_cubit.dart';
import 'package:book/Features/search/presentation/views/search_view.dart';
import 'package:book/core/utils/serviceLocator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static String khomeview = "/homeview";
  static String ksearchview = "/searchview";
  static String kBookDetailsview = "/bookDetails";

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: "/",
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: ksearchview,
        builder: (context, state) => BlocProvider(
          create: (context) => SearchCubit(
            getit.get<Home_Repo_Impl>(),
          ),
          child: const SearchView(),
        ),
      ),
      GoRoute(
        path: khomeview,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kBookDetailsview,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => SimilarBookCubit(
              getit.get<Home_Repo_Impl>(),
            ),
            child: BookDetails(
              bookModel: state.extra as BookModel,
            ),
          );
        },
      ),
    ],
  );
}
