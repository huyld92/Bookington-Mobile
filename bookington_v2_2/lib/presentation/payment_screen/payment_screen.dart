import 'package:bookington_v2_2/presentation/payment_screen/widgets/payment_successful_dialog.dart';

import 'controller/payment_controller.dart';
import 'package:flutter/material.dart';
import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/widgets/app_bar/appbar_image.dart';
import 'package:bookington_v2_2/widgets/app_bar/appbar_title.dart';
import 'package:bookington_v2_2/widgets/app_bar/custom_app_bar.dart';
import 'package:bookington_v2_2/widgets/custom_button.dart';

class PaymentScreen extends GetWidget<PaymentController> {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        appBar: CustomAppBar(
          height: getVerticalSize(80.00),
          leadingWidth: 64,
          leading: AppbarImage(
              height: getSize(64.00),
              width: getSize(64.00),
              svgPath: ImageConstant.imgArrowleft,
              margin: getMargin(left: 24, top: 10, bottom: 10),
              onTap: () {
                controller.getBack();
              }),
          title:
              AppbarTitle(text: "lbl_payment".tr, margin: getMargin(left: 16)),
        ),
        body: SingleChildScrollView(
          child: Container(
            width: size.width,
            padding: getPadding(left: 18, right: 18, bottom: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //info booking
                Padding(
                  padding: getPadding(top: 10),
                  child: Container(
                    padding: getPadding(
                      left: 24,
                      top: 15,
                      right: 24,
                      bottom: 15,
                    ),
                    decoration: AppDecoration.fillGray200.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder16,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: getPadding(
                            top: 0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: getPadding(
                                  top: 1,
                                ),
                                child: Text(
                                  "lbl_date".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtManropeSemiBold16Gray900
                                      .copyWith(
                                    letterSpacing: getHorizontalSize(
                                      0.20,
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                "12/12/2022".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtManropeBold18,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            top: 20,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: getPadding(
                                  top: 1,
                                ),
                                child: Text(
                                  "lbl_court".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtManropeSemiBold16Gray900
                                      .copyWith(
                                    letterSpacing: getHorizontalSize(
                                      0.20,
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                "Court 1".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtManropeBold18,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            top: 20,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: getPadding(
                                  top: 1,
                                ),
                                child: Text(
                                  "lbl_from".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtManropeSemiBold16Gray900
                                      .copyWith(
                                    letterSpacing: getHorizontalSize(
                                      0.20,
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                "10:00".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtManropeBold18,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            top: 19,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: getPadding(
                                  top: 1,
                                ),
                                child: Text(
                                  "lbl_total_hours".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtManropeSemiBold16Gray900
                                      .copyWith(
                                    letterSpacing: getHorizontalSize(
                                      0.20,
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                "2 Hours",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtManropeBold18,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: getPadding(top: 10),
                  child: Container(
                    padding: getPadding(
                      left: 24,
                      top: 15,
                      right: 24,
                      bottom: 15,
                    ),
                    decoration: AppDecoration.fillGray200.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder16,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: getPadding(
                            top: 0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: getPadding(
                                  top: 1,
                                ),
                                child: Text(
                                  "10:00 To 11:00".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtManropeRegular16.copyWith(
                                    letterSpacing: getHorizontalSize(
                                      0.20,
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                "100,000 VND".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtManropeBold18,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            top: 10,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: getPadding(
                                  top: 1,
                                ),
                                child: Text(
                                  "11:00 To 12:00".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtManropeRegular16.copyWith(
                                    letterSpacing: getHorizontalSize(
                                      0.20,
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                "100,000 VND".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtManropeBold18,
                              ),
                            ],
                          ),
                        ),
                        const Divider(
                          thickness: 2,
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: RichText(
                            text: TextSpan(
                              text: 'Total   ',
                              style: AppStyle.txtManropeRegular16,
                              children: <TextSpan>[
                                TextSpan(
                                  text: '200,000 VND',
                                  style: AppStyle.txtManropeBold18Red500,
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),

                //voucher
                GestureDetector(
                  onTap: () {
                    controller.chooseVoucher();
                  },
                  child: Container(
                    margin: getMargin(top: 10, bottom: 5),
                    padding:
                        getPadding(left: 15, top: 15, right: 15, bottom: 15),
                    decoration: AppDecoration.fillGray200.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Obx(
                          () => Row(
                            children: [
                              CustomImageView(
                                  svgPath: ImageConstant.imgCoupon,
                                  height: getVerticalSize(32.00),
                                  width: getHorizontalSize(32.00),
                                  radius: BorderRadius.circular(
                                      getHorizontalSize(4.00))),
                              controller.voucherID.value.isEmpty
                                  ? Padding(
                                      padding: getPadding(
                                          left: 12, top: 2, bottom: 2),
                                      child: Text("lbl_voucher".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtManropeBold18))
                                  : Padding(
                                      padding: getPadding(
                                          left: 12, top: 2, bottom: 2),
                                      child: Text("lbl_voucher_applied".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtManropeBold18)),
                            ],
                          ),
                        ),
                        CustomImageView(
                          height: getVerticalSize(32.00),
                          width: getHorizontalSize(32.00),
                          svgPath: ImageConstant.imgArrowright,
                        )
                      ],
                    ),
                  ),
                ),
                //momo
                GestureDetector(
                  onTap: () {
                    controller.choosePayment("Momo");
                  },
                  child: Container(
                    margin: getMargin(top: 10, bottom: 5),
                    padding: getPadding(all: 10),
                    decoration: AppDecoration.fillGray200.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CustomImageView(
                                svgPath: ImageConstant.imgMomo,
                                height: getVerticalSize(32.00),
                                width: getHorizontalSize(32.00),
                                radius: BorderRadius.circular(
                                    getHorizontalSize(4.00))),
                            Padding(
                                padding:
                                    getPadding(left: 12, top: 2, bottom: 2),
                                child: Text("lbl_momo".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtManropeBold18)),
                          ],
                        ),
                        Obx(
                          () => Radio<String>(
                            value: "Momo",
                            groupValue: controller.selectedPayment.value,
                            onChanged: (value) {
                              controller.changePaymentMethod(value);
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                // cash
                GestureDetector(
                  onTap: () {
                    controller.choosePayment("Cash");
                  },
                  child: Container(
                    margin: getMargin(top: 10, bottom: 5),
                    padding: getPadding(all: 10),
                    decoration: AppDecoration.fillGray200.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CustomImageView(
                                svgPath: ImageConstant.imgCashOnHand,
                                height: getVerticalSize(32.00),
                                width: getHorizontalSize(32.00),
                                radius: BorderRadius.circular(
                                    getHorizontalSize(4.00))),
                            Padding(
                                padding:
                                    getPadding(left: 12, top: 2, bottom: 2),
                                child: Text("lbl_cash".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtManropeBold18)),
                          ],
                        ),
                        Obx(
                          () => Radio<String>(
                            value: "Cash",
                            groupValue: controller.selectedPayment.value,
                            onChanged: (value) {
                              controller.changePaymentMethod(value);
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: getPadding(left: 16, right: 16, bottom: 20),
          child: SizedBox(
            height: 140,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 55,
                  margin: getMargin(bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: getPadding(all: 10),
                        child: Text("Total", style: AppStyle.txtManropeBold18),
                      ),
                      Padding(
                        padding: getPadding(all: 10),
                        child: Text("200,000 VND",
                            style: AppStyle.txtManropeBold18),
                      ),
                    ],
                  ),
                ),
                CustomButton(
                  height: 55,
                  width: 330,
                  text: "lbl_confirm_payment".tr,
                  onTap: () {
                    print("Confirm Payment");
                    Get.defaultDialog(
                      title: "",
                      content: PaymentSuccessfulDialog(controller),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  onTapArrowleft1() {
    // Get.back();
  }
}
