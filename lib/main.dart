import 'package:book/Features/Constants.dart';
import 'package:book/Features/Home/Data/repos/home_repo_impl.dart';
import 'package:book/Features/Home/Data/repos/presentation/manager/featuredBooks_cubit/featured_books_cubit.dart';
import 'package:book/Features/Home/Data/repos/presentation/manager/newestBooks_cubit/newest_books_cubit.dart';
import 'package:book/core/utils/AppRouter.dart';
import 'package:book/core/utils/serviceLocator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  setUpServiceLocaltor();
  runApp(const BookApp());
}

class BookApp extends StatelessWidget {
  const BookApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            return FeaturedBooksCubit(
              getit.get<Home_Repo_Impl>(),
            )..fetchFetchedBooks();
          },
        ),
        BlocProvider(
          create: (context) {
            return NewestBooksCubit(
              getit.get<Home_Repo_Impl>(),
            )..fetchNewestBooks();
          },
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: kPrimaryColor,
            textTheme: GoogleFonts.montserratTextTheme(
              ThemeData.dark().textTheme,
            )),
      ),
    );
  }
}
