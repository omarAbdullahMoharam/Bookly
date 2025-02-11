import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({
    super.key,
    required this.errorMsg,
  });
  final String errorMsg;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 16,
        children: [
          Icon(
            Icons.error,
            color: Colors.red,
          ),
          Center(
            child: Text(
              errorMsg,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
