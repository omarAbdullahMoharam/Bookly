part of 'similar_books_cubit.dart';

sealed class SimilarBooksState extends Equatable {
  const SimilarBooksState();

  @override
  List<Object> get props => [];
}

final class SimilarBooksInitial extends SimilarBooksState {}

final class SimilarBooksLoading extends SimilarBooksState {}

final class SimilarBooksSuccess extends SimilarBooksState {
  final List<BookModel> books;
  const SimilarBooksSuccess(this.books);
  @override
  List<Object> get props => [books];
}

final class SimilarBooksFailure extends SimilarBooksState {
  final String errorMsg;
  const SimilarBooksFailure(this.errorMsg);
  @override
  List<Object> get props => [errorMsg];
}
