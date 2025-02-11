import 'package:bookly/Core/utils/assets.dart';
import 'package:flutter/material.dart';

class TempErrorImage extends StatelessWidget {
  const TempErrorImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          AssetsData.tempCashedImage,
          fit: BoxFit.fill,
          width: double.infinity,
          height: double.infinity,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Icon(
                Icons.block,
                color: Colors.red,
                size: 60,
              ),
            ),
          ],
        )
      ],
    );
  }
}
