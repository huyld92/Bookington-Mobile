// import 'package:uni_links/uni_links.dart';
// import 'package:flutter/services.dart' show PlatformException;
//
// void initDeepLinks() async {
//   try {
//     final initialLink = await getInitialLink();
//     _handleDeepLink(initialLink);
//   } on PlatformException {
//     // Handle exception by checking PlatformException.code
//   }
//
//   getLinksStream().listen((String link) {
//     _handleDeepLink(link);
//   }, onError: (err) {
//     // Handle stream error by checking the error type
//   });
// }
//
// void _handleDeepLink(String link) {
//   if (link != null && link.startsWith('myapp://payment-confirmation')) {
//     // Extract payment details from the link and update app state
//     final orderId = Uri.parse(link).queryParameters['orderId'];
//     // Update app state with payment confirmation
//   }
// }
