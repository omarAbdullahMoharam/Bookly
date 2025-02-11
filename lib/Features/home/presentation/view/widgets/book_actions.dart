import 'package:bookly/Core/utils/functions/lunch_custom_url.dart';
import 'package:bookly/Core/widgets/cutom_button.dart';
import 'package:bookly/Core/models/book_model/book_model.dart';
import 'package:flutter/material.dart';

class BookActions extends StatelessWidget {
  const BookActions({
    super.key,
    required this.bookModel,
  });
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          Expanded(
            child: CustomButton(
              buttonLabel: 'Free',
              labelColor: Colors.black,
              backgroundColor: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
              onPressed: () {},
            ),
          ),
          Expanded(
            child: CustomButton(
              buttonLabel: getButtonLabel(bookModel),
              labelColor: Colors.white,
              backgroundColor: Color(0xFFEF8262),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
              onPressed: () async {
                lunchCustomUrl(
                  bookModel.volumeInfo.previewLink!,
                  context,
                );
              },
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

String getButtonLabel(BookModel bookModel) {
  if (bookModel.volumeInfo.previewLink == null) {
    return 'Not Available';
  } else {
    return 'Preview';
  }
}
