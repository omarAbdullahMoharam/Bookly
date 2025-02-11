import 'package:bookly/Core/utils/service_locator.dart';
import 'package:bookly/Core/models/book_model/book_model.dart';
import 'package:bookly/Features/home/data/repos/home_repo_impl.dart';
import 'package:bookly/Features/home/presentation/view/book_details_view.dart';
import 'package:bookly/Features/home/presentation/view/home_view.dart';
import 'package:bookly/Features/home/presentation/view_models/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly/Features/search/presentation/view/search_view.dart';
import 'package:bookly/Features/splash/presentation/views/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kInitialSplash = '/';
  static const kHome = '/homeView';
  static const kBookDetails = '/bookDetailsView';
  static const kSearch = '/searchView';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: kInitialSplash,
        builder: (context, state) => SplashView(),
      ),
      GoRoute(
        path: kHome,
        builder: (context, state) => HomeView(),
      ),
      GoRoute(
        path: kBookDetails,
        builder: (context, state) => BlocProvider(
          create: (context) => SimilarBooksCubit(
            getIt.get<HomeRepoImpl>(),
          ),
          child: BookDetailsView(
            bookModel: state.extra as BookModel,
          ),
        ),
      ),
      GoRoute(
        path: kSearch,
        builder: (context, state) => SearchView(),
      ),
    ],
  );
}
