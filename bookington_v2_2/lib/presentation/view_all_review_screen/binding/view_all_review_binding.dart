import 'package:bookington_v2_2/presentation/view_all_review_screen/controller/view_all_review_controller.dart';


import 'package:get/get.dart';

class ViewAllCommentReviewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ViewAllCommentReviewController(), fenix: true);
  }
}
