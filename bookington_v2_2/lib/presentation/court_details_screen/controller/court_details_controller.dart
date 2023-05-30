import 'dart:convert';

import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/data/apiClient/api_client.dart';
import 'package:bookington_v2_2/data/models/comment_rating_model.dart';
import 'package:bookington_v2_2/data/models/court_model.dart';
import 'package:bookington_v2_2/presentation/court_details_screen/models/court_details_model.dart';
import 'package:bookington_v2_2/presentation/court_details_screen/widgets/comment_rating_widget.dart';
import 'package:bookington_v2_2/presentation/court_details_screen/widgets/report_widget.dart';
import 'package:flutter/cupertino.dart';

class CourtDetailsController extends GetxController with StateMixin {
  Rx<CourtDetailsModel> courtDetailsModelObj = CourtDetailsModel.empty().obs;
  TextEditingController commentController = TextEditingController();
  TextEditingController reportContentController = TextEditingController();
  Rx<int> silderIndex = 2.obs;
  RxDouble rating = 0.0.obs;
  RxInt ratingStart = 0.obs;
  RxString errorText = "".obs;
  RxBool isBooked = false.obs;

  @override
  void onInit() {
    change(null, status: RxStatus.success());

    loadData();
    super.onInit();
  }

  loadData() async {
    try {
      Map<String, dynamic>? arg = Get.arguments;
      if (arg != null) {
        await getCourtDetails(arg["courtId"]!);
        await CheckUserIsBooked();
      }
    } on Exception {
      getBack();
    }
  }

  getCourtDetails(String id) async {
    change(null, status: RxStatus.loading());
    try {
      print(id);
      await ApiClient.getCourtDetails(id).then((result) {
        if (result.statusCode == 200) {
          CourtModel court =
              CourtModel.fromJson(jsonDecode(result.body)["result"]);
          courtDetailsModelObj.value = CourtDetailsModel(court);

          courtDetailsModelObj.value.slidericonItemList.value =
              court.listCourtImage;
          silderIndex.value = court.listCourtImage.length;
          ratingStart.value = courtDetailsModelObj.value.ratingStar.round();

          if (ratingStart.value == 0) {
            ratingStart.value = 1;
          }
        } else if (result.statusCode == 401 || result.statusCode == 403) {
          logout();
        } else {
          Get.defaultDialog(
              title: "Court Details",
              content: Text(
                "Cannot load court details now. Please do it later}",
                style: AppStyle.txtManropeRegular16,
              ));
          Logger.log(
              "CourtDetailsController error at api getCourtDetails: ${result.statusCode} \n ${result.body}");
        }
      });
    } catch (e) {
      Logger.log(
          "CourtDetailsController ERROR at getCourtDetails: ${e.toString()}");
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
    Map<String, dynamic> arg = Get.arguments;
    Get.toNamed(AppRoutes.chooseCourtScreen, arguments: arg);
  }

  getBack() {
    Get.back();
  }

  void favorite() {}

  Future<void> createComment() async {
    change(null, status: RxStatus.loading());
    try {
      String commentWriterId = PrefUtils.getString("userID")!;

      String refCourt = courtDetailsModelObj.value.id;

      String content = commentController.text;

      CommentRatingModel commentRatingModel =
          CommentRatingModel(commentWriterId, refCourt, content, rating.value);
      await ApiClient.createComment(commentRatingModel).then((result) {
        if (result.statusCode == 201) {
          // CommentModel commentModel =
          //     CommentModel.fromJson(jsonDecode(result.body)["result"]);
          Get.snackbar(
            'Post comment',
            "Post comment success",
            colorText: ColorConstant.black900,
            duration: const Duration(milliseconds: 2000),
            backgroundColor: ColorConstant.whiteA700,
            icon: CustomImageView(
                width: 16, height: 16, svgPath: ImageConstant.imgNotify),
          );
          loadData();
        } else if (result.statusCode == 401 || result.statusCode == 403) {
          logout();
        } else {
          Logger.log(
              "CourtDetailsController error at api createComment: ${result.statusCode}");
        }
      });
    } catch (e) {
      Get.snackbar(
        'Post comment',
        "Post comment failed",
        colorText: ColorConstant.black900,
        duration: const Duration(milliseconds: 1500),
        backgroundColor: ColorConstant.whiteA700,
        icon: CustomImageView(
            width: 16, height: 16, svgPath: ImageConstant.imgNotify),
      );
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

  void viewAllReviewsScreen() {
    Map<String, dynamic> arg = Get.arguments;
    Get.toNamed(AppRoutes.viewAllReviewScreen, arguments: arg);
  }

  Future<void> reportCourt() async {
    change(null, status: RxStatus.loading());
    try {
      String courtId = courtDetailsModelObj.value.id;
      String reportContent = reportContentController.text;
      await ApiClient.reportCourt(courtId, reportContent).then((result) {
        if (result.statusCode == 201) {
          // var jsonResult = jsonDecode(result.body);
          getBack();
          Get.snackbar(
            'Report',
            "Report court ${courtDetailsModelObj.value.name} success",
            colorText: ColorConstant.black900,
            duration: const Duration(milliseconds: 2000),
            backgroundColor: ColorConstant.whiteA700,
            icon: CustomImageView(
                width: 16, height: 16, svgPath: ImageConstant.imgNotify),
          );
        } else if (result.statusCode == 401 || result.statusCode == 403) {
          logout();
        } else {
          Get.snackbar(
            'Report',
            "Report court ${courtDetailsModelObj.value.name} failed",
            colorText: ColorConstant.black900,
            duration: const Duration(milliseconds: 2000),
            backgroundColor: ColorConstant.whiteA700,
            icon: CustomImageView(
                width: 16, height: 16, svgPath: ImageConstant.imgNotify),
          );

          Logger.log(
              "CourtDetailsController error at api reportCourt: ${result.statusCode}");
        }
      });
    } catch (e) {
      Get.snackbar(
        'Report',
        "Report court ${courtDetailsModelObj.value.name} failed",
        colorText: ColorConstant.black900,
        duration: const Duration(milliseconds: 2000),
        backgroundColor: ColorConstant.whiteA700,
        icon: CustomImageView(
            width: 16, height: 16, svgPath: ImageConstant.imgNotify),
      );
      Logger.log(
          "CourtDetailsController ERROR at reportCourt: ${e.toString()}");
    } finally {
      reportContentController.clear();
      change(null, status: RxStatus.success());
    }
  }

  void reportCourtBottomSheet() {
    Get.bottomSheet(ReportCourtWidget(), isDismissible: false);
  }

  CheckUserIsBooked() async {
    change(null, status: RxStatus.loading());
    try {
      String courtId = courtDetailsModelObj.value.id;
      String userId = PrefUtils.getString("userID")!;
      await ApiClient.checkUserIsBooked(userId, courtId).then((result) {
        if (result.statusCode == 201) {
          var jsonResult = jsonDecode(result.body);
          isBooked.value = jsonResult["result"] ?? false;

        } else if (result.statusCode == 401 || result.statusCode == 403) {
          logout();
        } else {
           isBooked.value = false;
        }
      });
    } catch (e) {
      isBooked.value = false;
      // Get.snackbar(
      //   'Report',
      //   "Report court ${courtDetailsModelObj.value.name} failed",
      //   colorText: ColorConstant.black900,
      //   duration: const Duration(milliseconds: 2000),
      //   backgroundColor: ColorConstant.whiteA700,
      //   icon: CustomImageView(
      //       width: 16, height: 16, svgPath: ImageConstant.imgNotify),
      // );
      Logger.log(
          "CourtDetailsController ERROR at reportCourt: ${e.toString()}");
    } finally {
      reportContentController.clear();
      change(null, status: RxStatus.success());
    }
  }
}
