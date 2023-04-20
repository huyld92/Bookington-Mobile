import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/presentation/court_details_screen/controller/court_details_controller.dart';
import 'package:bookington_v2_2/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CommentRatingWidget extends StatelessWidget {
  CourtDetailsController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getVerticalSize(350),
      padding: getPadding(bottom: 30),
      decoration: BoxDecoration(color: ColorConstant.whiteA700),
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: getPadding(bottom: 20),
                    child: Text(
                      'lbl_rate_court'.tr,
                      style: AppStyle.txtManropeExtraBold18,
                    ),
                  ),
                  Padding(
                    padding: getPadding(bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RatingBar.builder(
                          initialRating: 0,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemSize: 50,
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            controller.rating.value = rating;
                          },
                        ),
                      Padding(
                        padding: getPadding(left: 15),
                        child: Obx(() => Text("${controller.rating}/5", style: AppStyle.txtManropeBold16)),
                      )
                      ],
                    ),
                  ),
                  TextField(
                    controller: controller.commentController,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: 'lbl_comment'.tr,
                    ),
                    onChanged: (value) {

                    },
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                height: 48,
                width: size.width / 3,
                text: "lbl_cancel".tr,
                padding: ButtonPadding.PaddingAll12,
                variant: ButtonVariant.FillGray300,
                onTap: () {
                  controller.getBack();
                },
              ),
              CustomButton(
                margin: getMargin(left: 20),
                height: 48,
                width: size.width / 3,
                text: "lbl_send_review".tr,
                padding: ButtonPadding.PaddingAll12,
                onTap: () {
                  if (controller.rating.value == 0.0) {
                  } else if (controller.commentController.text.isEmpty) {
                  } else {
                    controller.createComment();
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
