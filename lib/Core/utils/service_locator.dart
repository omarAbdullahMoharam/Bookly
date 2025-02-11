import 'package:bookly/Core/utils/api_service.dart';
import 'package:bookly/Features/home/data/repos/home_repo_impl.dart';
import 'package:bookly/Features/search/data/repo/search_repo.dart';
import 'package:bookly/Features/search/data/repo/search_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

// Dependency Injection using GetIt for ApiService and HomeRepoImpl classes💉💉

// solve the problem of repeated creating a new instance✅✅
//of ApiService and HomeRepoImpl classes every time we need them
final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      getIt.get<ApiService>(),
    ),
  );
  getIt.registerSingleton<SearchRepo>(
    SearchRepoImpl(
      getIt.get<ApiService>(),
    ),
  );
}
