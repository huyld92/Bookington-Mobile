import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/data/models/comment_model.dart';
import 'package:bookington_v2_2/presentation/view_all_review_screen/controller/view_all_review_controller.dart';
import 'package:bookington_v2_2/presentation/view_all_review_screen/widgets/comment_item_widget.dart';
import 'package:bookington_v2_2/widgets/app_bar/appbar_image.dart';
import 'package:bookington_v2_2/widgets/app_bar/appbar_title.dart';
import 'package:bookington_v2_2/widgets/app_bar/custom_app_bar.dart';
import 'package:bookington_v2_2/widgets/loading_widget.dart';
import 'package:flutter/material.dart';

import 'widgets/view_review_empty_widget.dart';

class ViewAllCommentScreen extends GetWidget<ViewAllCommentReviewController> {
  const ViewAllCommentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return controller.obx((state) {
      return SafeArea(
          child: Scaffold(
        appBar: CustomAppBar(
          height: getVerticalSize(80.00),
          leadingWidth: 64,
          leading: AppbarImage(
            height: getVerticalSize(64),
            width: getVerticalSize(64),
            svgPath: ImageConstant.imgArrowLeft,
            margin: getMargin(left: 24),
            onTap: () {
              controller.getBack();
            },
          ),
          centerTitle: true,
          title: AppbarTitle(text: "lbl_reviews".tr),
        ),
        resizeToAvoidBottomInset: false,
        backgroundColor: ColorConstant.gray50,
        body: Container(
          padding: getPadding(all: 5),
          child: Column(
            children: [
              if (controller.listComment.isNotEmpty)
                Obx(
                  () => ListView.builder(
                    controller: controller.scroll,
                    shrinkWrap: true,
                    itemCount: controller.listComment.length,
                    itemBuilder: (context, index) {
                      CommentModel model = controller.listComment[index];
                      return CommentItemWidgets(model);
                    },
                  ),
                )
              else
                const ViewReviewEmptyWidget()
            ],
          ),
        ),
      ));
    }, onLoading: const LoadingWidget());
  }
}
