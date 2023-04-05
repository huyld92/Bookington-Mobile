import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/presentation/match_details_screen/controller/match_details_controller.dart';

class MatchDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MatchDetailsController(), fenix: true);
  }
}
