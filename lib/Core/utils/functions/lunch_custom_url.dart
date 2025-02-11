import 'dart:developer';

import 'package:bookly/Core/widgets/show_custom_snack_bar.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> lunchCustomUrl(String? url, context) async {
  if (url != null) {
    Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      log('Could not launch $uri');
      showSnackBar(context, uri);
    }
  }
}
