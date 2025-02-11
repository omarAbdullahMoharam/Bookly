import 'package:bookly/Core/models/book_model/book_model.dart';
import 'package:bookly/Features/home/presentation/view/widgets/book_actions.dart';
import 'package:bookly/Features/home/presentation/view/widgets/book_info_section.dart';
import 'package:bookly/Features/home/presentation/view/widgets/similar_books_section.dart';
import 'package:flutter/material.dart';

import 'custom_book_details_app_bar.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: [
                  CustomBookDetailsAppBar(),
                  BookInfoSection(bookModel: bookModel),
                  SizedBox(height: 35),
                  BookActions(bookModel: bookModel),
                  Expanded(
                    child: SizedBox(height: 49),
                  ),
                  SimilarBooksSection(),
                  SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
