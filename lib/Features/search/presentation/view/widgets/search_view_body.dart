import 'package:bookly/Core/utils/styles.dart';
import 'package:bookly/Core/widgets/custom_error_widget.dart';
import 'package:bookly/Core/widgets/custom_loading_indicator.dart';
import 'package:bookly/Features/search/presentation/view/widgets/custom_search_bar.dart';
import 'package:bookly/Features/search/presentation/view/widgets/search_result_list_view.dart';
import 'package:bookly/Features/search/presentation/view_models/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        return CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 30, right: 30, left: 2),
                child: Column(
                  children: [
                    CustomSearchAppBar(),
                    Padding(
                      padding: const EdgeInsets.only(top: 30, left: 30),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Search Results',
                          style: Styles.textStyle18.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            state is SearchLoading
                ? const SliverFillRemaining(
                    child: CustomLoadingIndicator(),
                  )
                : SliverFillRemaining(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: BlocBuilder<SearchCubit, SearchState>(
                        builder: (context, state) {
                          if (state is SearchSuccess) {
                            return SearchResultListView(
                              searchBooksResult: state.books,
                            );
                          } else if (state is SearchLoading) {
                            return const CustomLoadingIndicator();
                          } else if (state is SearchInitial) {
                            return const Center(
                              child: Text(
                                'Search for books 🔎',
                                style: Styles.textStyle18,
                              ),
                            );
                          } else {
                            return CustomErrorWidget(
                              errorMsg: state is SearchFailure
                                  ? state.errorMsg
                                  : 'An error occurred',
                            );
                          }
                        },
                      ),
                    ),
                  ),
          ],
        );
      },
    );
  }
}
