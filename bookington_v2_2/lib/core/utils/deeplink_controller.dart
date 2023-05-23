import 'package:bookington_v2_2/core/app_export.dart';
import 'package:get/get.dart';
import 'package:uni_links/uni_links.dart';

class DeepLinkController extends GetxController {
  String _link = '';

  String get link => _link;

  @override
  void onInit() {
    super.onInit();
    initDeepLinks();
  }

  void initDeepLinks() async {
    // Get initial deep link if the app was opened with one
    final initialLink = await getInitialLink();
    if (initialLink != null) {
      handleLink(initialLink);
    }

    // Listen for deep link changes
    linkStream.listen((String? link) {
      if (link != null) {
        handleLink(link);
       }
    }, onError: (err) {
      print('Failed to get latest link: $err.');
    });
  }

  void handleLink(String link) {
    // Handle the deep link here
    String paymentResult = link.substring(link.indexOf("=")+1);
    print('paymentResult=$paymentResult');
    print('link= $link');
    Map<String, String> arg = {
      "paymentResult":paymentResult
    };
    _link = link;

    Get.offNamed(AppRoutes.walletScreen, arguments: arg);
  }
}
