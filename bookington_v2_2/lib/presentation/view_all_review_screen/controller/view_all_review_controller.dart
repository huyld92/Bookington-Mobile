import 'dart:convert';

import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/data/apiClient/api_client.dart';
import 'package:bookington_v2_2/data/models/comment_model.dart';

class ViewAllCommentReviewController extends GetxController
    with StateMixin, ScrollMixin {
  RxList<CommentModel> listComment = RxList.empty();
  int pageNumber = 1;
  int totalCourt = 0;

  @override
  void onInit() {
    loadData();
    super.onInit();
  }

  void getBack() {
    Get.back();
  }

  Future<void> loadData() async {
    queryComment(1);
  }

  void logout() {
    PrefUtils.clearPreferencesData();
    Map<String, bool> arg = {"timeOut": true};
    Get.offAllNamed(AppRoutes.loginScreen, arguments: arg);
  }

  Future<void> queryComment(int pageNumber) async {
    change(null, status: RxStatus.loading());
    try {
      Map<String, String> arg = Get.arguments;
      String courtId = "";
      if (arg["courtId"] != null) {
        courtId = arg["courtId"] ?? "";
      }
      int maxPage = 15;
      await ApiClient.queryComment(courtId, pageNumber, maxPage).then((result) {
        if (result.statusCode == 200) {
          var jsonResult = jsonDecode(result.body);
          if (pageNumber == 1) {
            listComment.value = CommentModel.listFromJson(jsonResult["result"]);
          } else {
            listComment
                .addAll(CommentModel.listFromJson(jsonResult["result"]));
          }
          listComment.refresh();
        } else if (result.statusCode == 401 || result.statusCode == 403) {
          logout();
        } else {
          Logger.log(
              "ViewAllCommentReviewController error at api queryComment: ${result.statusCode},\n ${result.body}");
        }
      });
    } catch (e) {
      Logger.log(
          "ViewAllCommentReviewController error at queryComment: ${e.toString()}");
    } finally {
      change(null, status: RxStatus.success());
    }
  }

  @override
  Future<void> onEndScroll() async {
    change(null, status: RxStatus.loadingMore());
    if (listComment.length < totalCourt) {
      pageNumber++;
      await queryComment(pageNumber);
    }
  }

  @override
  Future<void> onTopScroll() async {

  }
}
