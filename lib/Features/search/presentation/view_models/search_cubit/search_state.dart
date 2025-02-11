part of 'search_cubit.dart';

class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

final class SearchInitial extends SearchState {}

final class SearchLoading extends SearchState {}

final class SearchSuccess extends SearchState {
  final List<BookModel> books;
  final String searchQuery;

  const SearchSuccess(this.books, this.searchQuery);
}

final class SearchFailure extends SearchState {
  final String errorMsg;
  const SearchFailure(this.errorMsg);
}
