import 'package:bookly/Core/utils/service_locator.dart';
import 'package:bookly/Features/search/data/repo/search_repo.dart';
import 'package:bookly/Features/search/presentation/view/widgets/search_view_body.dart';
import 'package:bookly/Features/search/presentation/view_models/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (context) => SearchCubit(getIt.get<SearchRepo>()),
          child: SearchViewBody(),
        ),
      ),
    );
  }
}
