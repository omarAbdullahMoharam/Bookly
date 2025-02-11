import 'package:bookly/Core/utils/styles.dart';
import 'package:bookly/Features/home/presentation/view/widgets/similar_books_list_view.dart';
import 'package:flutter/material.dart';

class SimilarBooksSection extends StatelessWidget {
  const SimilarBooksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'You can also like',
          style: Styles.textStyle14,
        ),
        SizedBox(height: 16),
        SimilarBooksListView(),
      ],
    );
  }
}
