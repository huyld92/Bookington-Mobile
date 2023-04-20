import 'dart:convert';

import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/data/apiClient/api_client.dart';
import 'package:bookington_v2_2/data/models/comment_rating_model.dart';
import 'package:bookington_v2_2/data/models/court_model.dart';
import 'package:bookington_v2_2/presentation/court_details_screen/models/court_details_model.dart';
import 'package:bookington_v2_2/presentation/court_details_screen/widgets/comment_rating_widget.dart';
import 'package:flutter/cupertino.dart';

class CourtDetailsController extends GetxController with StateMixin {
  Rx<CourtDetailsModel> courtDetailsModelObj = CourtDetailsModel.empty().obs;
  TextEditingController commentController = TextEditingController();
  Rx<int> silderIndex = 2.obs;
  RxDouble rating = 0.0.obs;
  RxInt countNumOfCharacter = 0.obs;

  @override
  void onInit() {
    loadData();
    super.onInit();
  }

  loadData() {
    try {
      Map<String, String> arg = Get.arguments;
      if (arg["courtId"] != null) {
        getCourtDetails(arg["courtId"]!);
      }
    } on Exception {
      getBack();
    }
  }

  getCourtDetails(String id) async {
    change(null, status: RxStatus.loading());
    try {
      await ApiClient.getCourtDetails(id).then((result) {
        if (result.statusCode == 200) {
          CourtModel court =
              CourtModel.fromJson(jsonDecode(result.body)["result"]);
          courtDetailsModelObj.value = CourtDetailsModel(court);
        } else if (result.statusCode == 401 || result.statusCode == 403) {
          logout();
        } else {
          Logger.log(
              "CourtDetailsController error at getCourtDetails: ${result.statusCode}");
        }
      });
    } catch (e) {
      Logger.log(
          "CourtDetailsController error at getCourtDetails: ${e.toString()}");
    } finally {
      change(null, status: RxStatus.success());
    }
  }

  void logout() {
    PrefUtils.clearPreferencesData();
    Map<String, bool> arg = {"timeOut": true};
    Get.offAllNamed(AppRoutes.loginScreen, arguments: arg);
  }

  void chooseCourtScreen() {
    Map<String, String> arg = Get.arguments;
    Get.toNamed(AppRoutes.chooseCourtScreen, arguments: arg);
  }

  getBack() {
    Get.back();
  }

  void favorite() {}

  Future<void> createComment() async {
    change(null, status: RxStatus.loading());
    try {
      String commentWriterId = PrefUtils.getString("userId")!;
      String refCourt = courtDetailsModelObj.value.id;
      String content = commentController.text;

      CommentRatingModel commentRatingModel =
          CommentRatingModel(commentWriterId, refCourt, content, rating.value);
      await ApiClient.createComment(commentRatingModel).then((result) {
        if (result.statusCode == 200) {
          CourtModel court =
              CourtModel.fromJson(jsonDecode(result.body)["result"]);
          courtDetailsModelObj.value = CourtDetailsModel(court);
        } else if (result.statusCode == 401 || result.statusCode == 403) {
          logout();
        } else {
          Logger.log(
              "CourtDetailsController error at createComment: ${result.statusCode}");
        }
      });
    } catch (e) {
      Logger.log(
          "CourtDetailsController error at createComment: ${e.toString()}");
    } finally {
      change(null, status: RxStatus.success());
    }
  }

  void commentAndRatingBottomSheet() {
    Get.bottomSheet(CommentRatingWidget(), isDismissible: false).then((value) {
      rating.value = 0.0;
    });
  }
}
