import 'package:bookington_v2_2/data/apiClient/api_client.dart';

import '../controller/recommend_controller.dart';
import 'package:get/get.dart';

class RecommendBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(RecommendController());
  }
}
