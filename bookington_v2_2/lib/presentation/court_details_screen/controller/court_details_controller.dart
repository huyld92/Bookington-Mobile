import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/presentation/court_details_screen/models/court_details_model.dart';


class CourtDetailsController extends GetxController {
  Rx<CourtDetailsModel> courtDetailsModelObj = CourtDetailsModel().obs;

  RxString radioGroup = "".obs;

  Rx<int> silderIndex = 2.obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();

    // group5615Controller.dispose();
  }

  void chooseCourtScreen(){
    Get.toNamed(AppRoutes.chooseCourtScreen);
  }
}
