import 'package:book/core/utils/functions/Customsnackbar.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore_for_file: non_constant_identifier_names

Future<void> LaunchCustomUrl(context, String? text) async {
  if (text != null) {
    Uri url = Uri.parse(text);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      CustomSnackBar(context, text);
    }
  }
}
