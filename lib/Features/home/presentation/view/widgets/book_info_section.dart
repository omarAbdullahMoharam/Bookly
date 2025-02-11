import 'package:bookly/Core/utils/styles.dart';
import 'package:bookly/Core/widgets/temp_error_image.dart';
import 'package:bookly/Core/models/book_model/book_model.dart';
import 'package:bookly/Features/home/presentation/view/widgets/book_rating.dart';
import 'package:bookly/Features/home/presentation/view/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';

class BookInfoSection extends StatelessWidget {
  const BookInfoSection({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    bool isNullLnk = bookModel.volumeInfo.imageLinks?.thumbnail == null;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        !isNullLnk
            ? Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.2,
                  vertical: height * 0.026,
                ),
                child: CustomBookImage(
                  imageUrl: bookModel.volumeInfo.imageLinks!.thumbnail,
                ),
              )
            : Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.2,
                  vertical: height * 0.026,
                ),
                child: TempErrorImage()),
        SizedBox(height: 40),
        Text(
          bookModel.volumeInfo.title!,
          style: Styles.textStyle30.copyWith(
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 4),
        Opacity(
          opacity: 0.7,
          child: Text(
            bookModel.volumeInfo.authors?[0] ?? 'Unknown Author',
            style: Styles.textStyle20.copyWith(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(height: 16),
        BookRating(
          mainAxisAlignment: MainAxisAlignment.center,
          rating: bookModel.volumeInfo.averageRating ?? 0,
          count: bookModel.volumeInfo.ratingsCount ?? 0,
        ),
      ],
    );
  }
}
