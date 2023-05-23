// ignore_for_file: avoid_print

import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/data/models/voucher_model.dart';
import 'package:bookington_v2_2/presentation/choose_voucher_screen/controller/voucher_controller.dart';
import 'package:bookington_v2_2/presentation/choose_voucher_screen/widgets/list_voucher_item_widget.dart';
import 'package:bookington_v2_2/presentation/choose_voucher_screen/widgets/voucher_empty_widget.dart';
import 'package:bookington_v2_2/widgets/app_bar/appbar_image.dart';
import 'package:bookington_v2_2/widgets/app_bar/appbar_title.dart';
import 'package:bookington_v2_2/widgets/app_bar/custom_app_bar.dart';
import 'package:bookington_v2_2/widgets/custom_button.dart';
import 'package:bookington_v2_2/widgets/custom_text_form_field.dart';
import 'package:bookington_v2_2/widgets/loading_widget.dart';
import 'package:flutter/material.dart';

class VoucherScreen extends GetWidget<VoucherController> {
  const VoucherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return controller.obx((state) {
      return SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            backgroundColor: ColorConstant.whiteA700,
            appBar: CustomAppBar(
              height: getVerticalSize(80.00),
              leadingWidth: 64,
              leading: AppbarImage(
                height: getSize(64.00),
                width: getSize(64.00),
                svgPath: ImageConstant.imgArrowLeft,
                margin: getMargin(left: 24),
                onTap: () {
                  controller.getBack();
                },
              ),
              centerTitle: true,
              title: AppbarTitle(text: "lbl_choose_voucher".tr),
            ),
            body: SingleChildScrollView(
              child: Container(
                padding: getPadding(left: 15, right: 15),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              border: BorderRadiusStyle.border2Gray500,
                              borderRadius: BorderRadiusStyle.roundedBorder10),
                          child: CustomTextFormField(
                            controller: controller.voucherController,
                            shape: TextFormFieldShape.RoundedBorder10,
                            width: 250,
                            hintText: "lbl_enter_voucher_code".tr,
                            fontStyle: TextFormFieldFontStyle.ManropeMedium14,
                            suffix: CustomImageView(
                              width: 16,
                              margin: getMargin(all: 10),
                              color: ColorConstant.gray500,
                              svgPath: ImageConstant.imgCancel,
                              onTap: () {
                                controller.voucherController.clear();
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                            height: 55,
                            width: 80,
                            // color: Colors.amberAccent,
                            child: CustomButton(
                              text: "lbl_apply".tr,
                              fontStyle: ButtonFontStyle.ManropeBold14WhiteA700,
                              onTap: () {
                                print('Apply');
                              },
                            ))
                      ],
                    ),
                    Container(
                      height: getVerticalSize(520),
                      margin: getMargin(top: 20),
                      child: Column(
                        children: [
                          if (controller.listVoucherMode.isNotEmpty)
                            Obx(
                              () => ListView.separated(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                separatorBuilder: (context, index) {
                                  return SizedBox(
                                    height: getVerticalSize(
                                      20.00,
                                    ),
                                  );
                                },
                                itemCount: controller.listVoucherMode.length,
                                itemBuilder: (context, index) {
                                  VoucherModel model =
                                      controller.listVoucherMode[index];
                                  return ListVoucherItemWidget(model, index);
                                },
                              ),
                            )
                          else
                            VoucherEmptyWidget()
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            bottomNavigationBar: Container(
              padding: getPadding(left: 24, top: 15, right: 24, bottom: 15),
              decoration: BoxDecoration(
                border: BorderRadiusStyle.borderGrayT1,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    height: 55,
                    width: 320,
                    text: "lbl_ok".tr,
                    onTap: () {
                      controller.getBack();
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      );
    }, onLoading: const LoadingWidget());
  }
}
