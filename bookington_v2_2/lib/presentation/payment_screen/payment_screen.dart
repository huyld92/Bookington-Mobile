
import 'package:bookington_v2_2/presentation/payment_screen/widgets/payment_successful_dialog.dart';

import 'controller/payment_controller.dart';
import 'package:flutter/material.dart';
import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/widgets/app_bar/appbar_image.dart';
import 'package:bookington_v2_2/widgets/app_bar/appbar_title.dart';
import 'package:bookington_v2_2/widgets/app_bar/custom_app_bar.dart';
import 'package:bookington_v2_2/widgets/custom_button.dart';

// enum SingingCharacter { Momo }

class PaymentScreen extends GetWidget<PaymentController> {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
            backgroundColor: ColorConstant.whiteA700,
            appBar: CustomAppBar(
              height: getVerticalSize(52.00),
              leadingWidth: 52,
              leading: AppbarImage(
                  height: getSize(28.00),
                  width: getSize(28.00),
                  svgPath: ImageConstant.imgArrowleft,
                  margin: getMargin(left: 24, top: 10, bottom: 10),
                  onTap: controller.getBack()),
              title: AppbarTitle(
                  text: "lbl_payment".tr, margin: getMargin(left: 16)),
            ),
            body: Container(
                width: size.width,
                padding: getPadding(left: 18, top: 10, right: 18, bottom: 10),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          padding: getPadding(all: 10),
                          decoration: AppDecoration.fillGray300.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder16),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomImageView(
                                    imagePath: ImageConstant.imgPhoThoCourt,
                                    height: getSize(110.00),
                                    width: getSize(110.00),
                                    radius: BorderRadius.circular(
                                        getHorizontalSize(16.00))),
                                Padding(
                                    padding: getPadding(
                                        left: 16, top: 10, bottom: 9),
                                    child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        children: [
                                          Text("Phu Tho Court",
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle.txtManropeBold20),
                                          Padding(
                                              padding: getPadding(top: 5),
                                              child: Text(
                                                  "District 11, HCM city".tr,
                                                  overflow:
                                                  TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtManropeSemiBold14
                                                      .copyWith(
                                                      letterSpacing:
                                                      getHorizontalSize(
                                                          0.20)))),
                                          Padding(
                                              padding: getPadding(top: 5),
                                              child: Row(children: [
                                                CustomImageView(
                                                    svgPath:
                                                    ImageConstant.imgStar,
                                                    height: getSize(12.00),
                                                    width: getSize(12.00),
                                                    margin: getMargin(
                                                        top: 2, bottom: 2)),
                                                Padding(
                                                    padding:
                                                    getPadding(left: 4),
                                                    child: Text("4.9",
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                        TextAlign.left,
                                                        style: AppStyle
                                                            .txtManropeSemiBold14
                                                            .copyWith(
                                                            letterSpacing:
                                                            getHorizontalSize(
                                                                0.20)))),
                                                Padding(
                                                    padding: getPadding(
                                                        left: 8, bottom: 1),
                                                    child: Text(
                                                        "(100 reviews)".tr,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                        TextAlign.left,
                                                        style: AppStyle
                                                            .txtManropeSemiBold12
                                                            .copyWith(
                                                            letterSpacing:
                                                            getHorizontalSize(
                                                                0.20)))),
                                              ])),
                                          Padding(
                                              padding:
                                              getPadding(top: 5, bottom: 0),
                                              child: Row(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                                  children: [
                                                    Text("10.000 VND".tr,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                        TextAlign.left,
                                                        style: AppStyle
                                                            .txtManropeBold20Blue500),
                                                    Padding(
                                                        padding:
                                                        getPadding(top: 5),
                                                        child: Text(
                                                            "lbl_slot".tr,
                                                            overflow:
                                                            TextOverflow
                                                                .ellipsis,
                                                            textAlign:
                                                            TextAlign.left,
                                                            style: AppStyle
                                                                .txtManropeSemiBold10
                                                                .copyWith(
                                                                letterSpacing:
                                                                getHorizontalSize(
                                                                    0.20))))
                                                  ]))
                                        ])),
                              ])),
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
                          decoration: AppDecoration.fillGray300.copyWith(
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
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: getPadding(
                                        top: 1,
                                      ),
                                      child: Text(
                                        "lbl_court".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle
                                            .txtManropeSemiBold16Gray900
                                            .copyWith(
                                          letterSpacing: getHorizontalSize(
                                            0.20,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "Court 7".tr,
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
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: getPadding(
                                        top: 1,
                                      ),
                                      child: Text(
                                        "lbl_start".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle
                                            .txtManropeSemiBold16Gray900
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
                                  top: 20,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: getPadding(
                                        top: 1,
                                      ),
                                      child: Text(
                                        "lbl_end".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle
                                            .txtManropeSemiBold16Gray900
                                            .copyWith(
                                          letterSpacing: getHorizontalSize(
                                            0.20,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "12:00".tr,
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
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: getPadding(
                                        top: 1,
                                      ),
                                      child: Text(
                                        "lbl_total_hours".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle
                                            .txtManropeSemiBold16Gray900
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
                      //coupon
                      Container(
                          margin: getMargin(top: 10, bottom: 5),
                          padding: getPadding(
                              left: 15, top: 15, right: 15, bottom: 15),
                          decoration: AppDecoration.fillGray300.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder16),
                          child: Row(children: [
                            CustomImageView(
                                svgPath: ImageConstant.imgCoupon,
                                height: getVerticalSize(48.00),
                                width: getHorizontalSize(48.00),
                                radius: BorderRadius.circular(
                                    getHorizontalSize(4.00))),
                            Padding(
                                padding:
                                getPadding(left: 12, top: 2, bottom: 2),
                                child: Text("lbl_coupon".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtManropeBold18)),
                            Padding(
                                padding: getPadding(left: 120),
                                child: CustomImageView(
                                  height: 48,
                                  width: 48,
                                  svgPath: ImageConstant.imgArrowright,
                                  onTap: () {
                                    print("arrow right");
                                  },
                                ))
                          ])),
                      Container(
                          margin: getMargin(top: 10, bottom: 5),
                          padding: getPadding(
                              left: 15, top: 15, right: 15, bottom: 15),
                          decoration: AppDecoration.fillGray300.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder16),
                          child: Row(children: [
                            CustomImageView(
                                svgPath: ImageConstant.imgMomo,
                                height: getVerticalSize(48.00),
                                width: getHorizontalSize(48.00),
                                radius: BorderRadius.circular(
                                    getHorizontalSize(4.00))),
                            Padding(
                                padding:
                                getPadding(left: 12, top: 2, bottom: 2),
                                child: Text("lbl_momo".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtManropeBold18)),
                            Padding(
                              padding: getPadding(left: 140),
                              child: Radio<dynamic>(
                                value: null,
                                groupValue: null,
                                onChanged: (value) {
                                  print("momo payment");
                                },
                              ),
                            )
                          ]))
                    ])),
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
                              Padding(padding: getPadding(all: 10),
                                child: Text(
                                    "Total", style: AppStyle.txtManropeBold18),
                              ),
                              Padding(
                                padding: getPadding(all: 10),
                                child:
                                Text(
                                    "20.000 VND",
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
                      ]),)
            )
        )
    );
  }

  onTapArrowleft1() {
    // Get.back();
  }
}
