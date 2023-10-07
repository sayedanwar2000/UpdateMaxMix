// ignore_for_file: non_constant_identifier_names, camel_case_types

import 'package:url_launcher/url_launcher.dart';

class functionsShare {

  //this function to make user go to website for ( FQA - privacy Policy - HOW TO USE - whatsapp)
  static Future<void> launchInBrowser({
    int? launchTo,
    String? urlPath,
  }) async {
    final Uri privacyPolicy = Uri.parse('https://masmix.com/privacy-policy');
    final Uri termsConditions =
        Uri.parse('https://masmix.com/terms-conditions');
    final Uri FAQ = Uri.parse('https://masmix.com/faq');
    final Uri whatsappUSA = Uri.parse('whatsapp://send?phone=+13025536688');
    final Uri whatsappKSA = Uri.parse('whatsapp://send?phone=+966553778808');
    final Uri path = Uri.parse('$urlPath');
    Uri url;
    if (launchTo == 1) {
      url = privacyPolicy;
    } else if (launchTo == 2) {
      url = termsConditions;
    } else if (launchTo == 3) {
      url = FAQ;
    } else if (launchTo == 4) {
      url = whatsappUSA;
    } else if (launchTo == 5) {
      url = whatsappKSA;
    }else {
      url = path;
    }
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }

  //this function to display print Long String to help me to see all data
  static void printLongString(String text) {
    final RegExp pattern = RegExp('.{1,1000}'); // 800 is the size of each chunk
    pattern.allMatches(text).forEach((RegExpMatch match) =>   print(match.group(0)));
  }
}
