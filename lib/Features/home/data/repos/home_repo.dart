import 'package:bookly/Core/errors/failures.dart';
import 'package:bookly/Core/models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  // Either is a class that takes two types of data and oyu can return one of them
  // Takes Rigtht R , Left L ----> in our case the Right is the BookModel and the Left is the Failures
  Future<Either<Failures, List<BookModel>>> fetchFeaturedBooks();
  Future<Either<Failures, List<BookModel>>> fetchNewestBooks();
  Future<Either<Failures, List<BookModel>>> fetchSimilarBooks(
      {required String category});
}
