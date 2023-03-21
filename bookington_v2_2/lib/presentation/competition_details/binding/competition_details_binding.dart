import 'package:bookington_v2_2/presentation/competition_details/controller/competition_details_controller.dart';
import 'package:get/get.dart';

class CompetitionDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CompetitionDetailsController(), fenix: true);
  }
}
