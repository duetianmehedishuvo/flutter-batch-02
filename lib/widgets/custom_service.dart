import 'package:url_launcher/url_launcher.dart';

Future<void> makePhoneCall(String phoneNumber) async {
  final Uri launchUri = Uri(scheme: 'tel', path: phoneNumber);
  await launchUrl(launchUri);
}

Future<void> openMail(String mailAddress) async {
  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries.map((MapEntry<String, String> e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}').join('&');
  }

  final Uri emailLaunchUri = Uri(
    scheme: 'mailto',
    path: mailAddress,
    query: encodeQueryParameters(<String, String>{'subject': 'Hello this is test Subject'}),
  );

  launchUrl(emailLaunchUri);
}
