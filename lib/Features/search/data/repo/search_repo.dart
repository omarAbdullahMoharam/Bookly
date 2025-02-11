import 'package:bookly/Core/errors/failures.dart';
import 'package:bookly/Core/models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepo {
  Future<Either<Failures, List<BookModel>>> getSearchResults(
      {required String query});
}
