import 'package:bookly/Core/utils/styles.dart';
import 'package:flutter/material.dart';

void showSnackBar(context, Uri uri) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.grey,
      content: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 30,
        child: Center(
          child: ListTile(
            leading: Icon(
              Icons.error,
              color: Colors.red,
              size: 20,
            ),
            title: Text(
              'Could not launch $uri',
              style: Styles.textStyle16.copyWith(
                color: Colors.black,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              textAlign: TextAlign.start,
            ),
          ),
        ),
      ),
    ),
  );
}
