import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/data/apiClient/api_client.dart';
import 'package:bookington_v2_2/data/models/court_images.dart';
import 'package:bookington_v2_2/data/models/court_model.dart';
import 'package:bookington_v2_2/presentation/recommend_screen/models/recommend_item_model.dart';
import 'package:bookington_v2_2/presentation/recommend_screen/models/recommend_model.dart';

class RecommendController extends GetxController
    with StateMixin<List<CourtModel>> {

  Rx<RecommendModel> recommendModelObj = RecommendModel().obs;

  // List<RecommendItemModel> list = <RecommendItemModel>[];

  @override
  void onInit() {
    findAllCourt();
    super.onInit();
  }

  void findAllCourt() {
    // ApiClient.searchCourt(1, "").then((result) {
    //   List<CourtModel>? data = result;
    //   CourtImage courtImage = CourtImage(
    //       id: "id",
    //       courtId: "courtId",
    //       image_binary: "assets/images/img_phutho_court.png");
    //   data?.forEach((c) {
    //     recommendModelObj.value.recommendItemList.add(new RecommendItemModel.full(
    //         court: c, courtImage: courtImage, rating: "4.9"));
    //
    //     // list.add(new RecommendItemModel.full(
    //     //     court: c, courtImage: courtImage, rating: "4.9"));
    //   });
    //   change(data, status: RxStatus.success());
    // }, onError: (err) {
    //   change(null, status: RxStatus.error(err.toString()));
    // });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

// void insertCity() {
//   const body = {'nome': 'joao', 'idade': 47};
//
//   cityProvider.postCity(body).then((result) {
//     print(result.body.abbreviation);
//     print(result.body.name);
//   });
// }
}
