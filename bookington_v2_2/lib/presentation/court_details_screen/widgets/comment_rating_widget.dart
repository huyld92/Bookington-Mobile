import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/presentation/court_details_screen/controller/court_details_controller.dart';
import 'package:bookington_v2_2/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CommentRatingWidget extends StatelessWidget {
  CommentRatingWidget({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  CourtDetailsController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: SingleChildScrollView(
        child: Container(
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
                              allowHalfRating: false,
                              itemCount: 5,
                              itemSize: 50,
                              itemBuilder: (context, _) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {
                                controller.rating.value = rating;
                                controller.errorText.value = "";
                              },
                            ),
                            Padding(
                              padding: getPadding(left: 15),
                              child: Obx(() => Text("${controller.rating}/5.0",
                                  style: AppStyle.txtManropeBold16)),
                            )
                          ],
                        ),
                      ),
                      if (controller.errorText.isNotEmpty)
                        Obx(() => Padding(
                              padding: getPadding(bottom: 15),
                              child: Text(
                                controller.errorText.value,
                                style: AppStyle.txtManropeSemiBold14Red500,
                              ),
                            )),
                      Form(
                        key: _formKey,
                        child: TextFormField(
                          controller: controller.commentController,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            labelText: 'lbl_comment'.tr,
                          ),
                          maxLengthEnforcement:
                              MaxLengthEnforcement.truncateAfterCompositionEnds,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(200),
                          ],
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Write a comment before submitting";
                            } else if (value.length > 200) {
                              return "Maximum 200 characters";
                            }
                            return null;
                          },
                        ),
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
                    height: getSize(48),
                    width: size.width / 3,
                    text: "lbl_submit".tr,
                    padding: ButtonPadding.PaddingAll12,
                    onTap: () async {
                      if (controller.rating.value == 0.0) {
                        controller.errorText.value =
                            "Please rating before submitting";
                        if (_formKey.currentState!.validate()) {}
                      } else if (_formKey.currentState!.validate()) {
                        controller.getBack();
                        await controller.createComment();
                        controller.commentController.clear();
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
