import 'package:bookly/Core/models/book_model/book_model.dart';
import 'package:bookly/Features/home/presentation/view/widgets/newest_books_card_item.dart';
import 'package:flutter/material.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key, required this.searchBooksResult});
  final List<BookModel> searchBooksResult;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      itemCount: searchBooksResult.length,
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: BookListViewItem(
            bookModel: searchBooksResult[index],
          ),
        );
      },
    );
  }
}
