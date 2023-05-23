
import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/core/utils/map_utils.dart';
import 'package:bookington_v2_2/core/utils/signalr_connection.dart';
import 'package:bookington_v2_2/data/apiClient/api_client.dart';

import 'deeplink_controller.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(PrefUtils());
    // Get.put(MapUtils());
    Get.put(ApiClient());
    Connectivity connectivity = Connectivity();
    Get.put(NetworkInfo(connectivity));
    Get.put(DeepLinkController());
   }
}
