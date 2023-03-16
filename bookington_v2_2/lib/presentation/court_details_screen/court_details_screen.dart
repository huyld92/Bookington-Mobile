import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/presentation/court_details_screen/widgets/list_rating_item_widget.dart';
import 'package:bookington_v2_2/presentation/court_details_screen/widgets/slidericon_item_widget.dart';
import 'package:bookington_v2_2/widgets/app_bar/appbar_image.dart';
import 'package:bookington_v2_2/widgets/app_bar/appbar_title.dart';
import 'package:bookington_v2_2/widgets/app_bar/custom_app_bar.dart';
import 'package:bookington_v2_2/widgets/custom_button.dart';
import 'package:bookington_v2_2/widgets/custom_icon_button.dart';
import 'package:intl/intl.dart';

import 'controller/court_details_controller.dart';
import 'models/listfive_item_model.dart';
import 'models/slidericon_item_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CourtDetailsScreen extends GetWidget<CourtDetailsController> {
  const CourtDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
            height: getVerticalSize(80.00),
            leadingWidth: 64,
            leading: AppbarImage(
              height: getSize(64.00),
              width: getSize(64.00),
              svgPath: ImageConstant.imgArrowleft,
              margin: getMargin(left: 24),
              onTap: () {
                controller.getBack();
              },
            ),
            centerTitle: true,
            title: AppbarTitle(text: "lbl_court_details".tr)),
        // backgroundColor: ColorConstant.blueGray50,
        backgroundColor: ColorConstant.whiteA700,
        body: controller.obx(
                (state) =>  SizedBox(
          width: size.width,
          child: SingleChildScrollView(
            child: Padding(
              padding: getPadding(
                left: 20,
                top: 15,
                bottom: 5,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: getSize(
                      340.00,
                    ),
                    width: getSize(
                      343.00,
                    ),
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        //image court
                        Obx(
                          () => CarouselSlider.builder(
                            options: CarouselOptions(
                              height: getSize(
                                343.00,
                              ),
                              initialPage: 0,
                              autoPlay: true,
                              viewportFraction: 1.0,
                              enableInfiniteScroll: false,
                              scrollDirection: Axis.horizontal,
                              onPageChanged: (index, reason) {
                                controller.silderIndex.value = index;
                              },
                            ),
                            itemCount: controller.courtDetailsModelObj.value
                                .slidericonItemList.length,
                            itemBuilder: (context, index, realIndex) {
                              SlidericonItemModel model = controller
                                  .courtDetailsModelObj
                                  .value
                                  .slidericonItemList[index];
                              return SlidericonItemWidget(
                                model,
                              );
                            },
                          ),
                        ),
                        // Info court
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Obx(
                            () => Container(
                              height: getVerticalSize(
                                3.00,
                              ),
                              margin: getMargin(
                                bottom: 16,
                              ),
                              child: AnimatedSmoothIndicator(
                                activeIndex: controller.silderIndex.value,
                                count: controller.courtDetailsModelObj.value
                                    .slidericonItemList.length,
                                axisDirection: Axis.horizontal,
                                effect: ScrollingDotsEffect(
                                  spacing: 4,
                                  activeDotColor: ColorConstant.blue500,
                                  dotColor: ColorConstant.gray30099,
                                  dotHeight: getVerticalSize(
                                    3.00,
                                  ),
                                  dotWidth: getHorizontalSize(
                                    16.00,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                      padding: getPadding(
                        top: 5,
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: getPadding(
                              left: 6,
                              top: 10,
                            ),
                            child: Row(
                              children: [
                                CustomIconButton(
                                  height: 34,
                                  width: 34,
                                  // variant: IconButtonVariant.FillBlue500,
                                  shape: IconButtonShape.RoundedBorder5,
                                  padding: IconButtonPadding.PaddingAll6,
                                  child: CustomImageView(
                                    svgPath: ImageConstant.imgClock,
                                  ),
                                ),
                                Padding(
                                  padding: getPadding(
                                    left: 8,
                                  ),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Padding(
                                      padding: getPadding(
                                        top: 1,
                                      ),
                                      child: Text(
                                        "${DateFormat("HH:mm").format(controller.courtDetailsModelObj.value.openAt)}"
                                        "-${DateFormat("HH:mm").format(controller.courtDetailsModelObj.value.closeAt)}",
                                        // "10:00-24:00",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style:
                                            AppStyle.txtManropeBold12.copyWith(
                                          letterSpacing: getHorizontalSize(
                                            0.40,
                                          ),
                                          height: getVerticalSize(
                                            1.10,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),

                                ),
                                CustomIconButton(
                                  height: 34,
                                  width: 34,
                                  margin: getMargin(
                                    left: 50,
                                  ),
                                  // variant: IconButtonVariant.FillBlue500,
                                  shape: IconButtonShape.RoundedBorder5,
                                  padding: IconButtonPadding.PaddingAll6,
                                  child: CustomImageView(
                                    svgPath: ImageConstant.imgPhone,
                                  ),
                                ),
                                Padding(
                                  padding: getPadding(
                                    left: 8,
                                  ),
                                  child:
                                  Padding(
                                    padding: getPadding(
                                      top: 1,
                                    ),
                                    child: Text(
                                      "0907-123-321".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtManropeBold12
                                          .copyWith(
                                        letterSpacing: getHorizontalSize(
                                          0.40,
                                        ),
                                        height: getVerticalSize(
                                          1.10,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: getPadding(
                              left: 6,
                              top: 10,
                            ),
                            child: Row(
                              children: [
                                CustomIconButton(
                                  height: 34,
                                  width: 34,
                                  shape: IconButtonShape.RoundedBorder5,
                                  padding: IconButtonPadding.PaddingAll6,
                                  child: CustomImageView(
                                    svgPath: ImageConstant.imgMoney,
                                  ),
                                ),
                                Padding(
                                  padding: getPadding(
                                    left: 8,
                                  ),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Padding(
                                      padding: getPadding(
                                        top: 1,
                                      ),
                                      child: Text(
                                        controller.courtDetailsModelObj.value.moneyPerHour
                                            .toString() +
                                            "lbl_hour".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtManropeBold12
                                            .copyWith(
                                          letterSpacing: getHorizontalSize(
                                            0.40,
                                          ),
                                          height: getVerticalSize(
                                            1.10,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),

                                 ),
                                CustomIconButton(
                                  height: 34,
                                  width: 34,
                                  margin: getMargin(
                                    left: 30,
                                  ),
                                  shape: IconButtonShape.RoundedBorder5,
                                  padding: IconButtonPadding.PaddingAll6,
                                  child: CustomImageView(
                                    svgPath: ImageConstant.imgBadmintonCourt,
                                  ),
                                ),
                                Padding(
                                  padding: getPadding(
                                    left: 8,
                                  ),
                                  child:                                      Padding(
                                    padding: getPadding(
                                      top: 1,
                                    ),
                                    child: Text(
                                      " ${controller.courtDetailsModelObj.value.numberOfSubCourt}",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtManropeBold12
                                          .copyWith(
                                        letterSpacing: getHorizontalSize(
                                          0.40,
                                        ),
                                        height: getVerticalSize(
                                          1.10,
                                        ),
                                      ),
                                    ),
                                  ),

                                  // Column(
                                  //   crossAxisAlignment:
                                  //       CrossAxisAlignment.start,
                                  //   mainAxisAlignment: MainAxisAlignment.start,
                                  //   children: [
                                  //     Text(
                                  //       "lbl_AmountCourt".tr,
                                  //       overflow: TextOverflow.ellipsis,
                                  //       textAlign: TextAlign.left,
                                  //       style: AppStyle.txtManropeRegular10
                                  //           .copyWith(
                                  //         letterSpacing: getHorizontalSize(
                                  //           0.40,
                                  //         ),
                                  //         height: getVerticalSize(
                                  //           1.10,
                                  //         ),
                                  //       ),
                                  //     ),
                                  //     Padding(
                                  //       padding: getPadding(
                                  //         top: 1,
                                  //       ),
                                  //       child: Text(
                                  //         " ${controller.courtModel.numberOfSubCourt}",
                                  //         overflow: TextOverflow.ellipsis,
                                  //         textAlign: TextAlign.left,
                                  //         style: AppStyle.txtManropeBold12
                                  //             .copyWith(
                                  //           letterSpacing: getHorizontalSize(
                                  //             0.40,
                                  //           ),
                                  //           height: getVerticalSize(
                                  //             1.10,
                                  //           ),
                                  //         ),
                                  //       ),
                                  //     ),
                                  //   ],
                                  // ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),
                  Padding(
                    padding: getPadding(
                      left: 6,
                      top: 31,
                    ),
                    child: Text(
                      "lbl_about".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtManropeBold18.copyWith(
                        letterSpacing: getHorizontalSize(
                          0.20,
                        ),
                        height: getVerticalSize(
                          1.02,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: getHorizontalSize(
                      327.00,
                    ),
                    margin: getMargin(
                      left: 8,
                      top: 13,
                    ),
                    child: Text(
                      "msg_about_phutho_court".tr,
                      maxLines: null,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtManropeRegular14.copyWith(
                        height: getVerticalSize(
                          1.10,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      left: 8,
                      top: 13,
                    ),
                    child: Row(
                      children: [
                        Text(
                          "lbl_see_more".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtManropeBold14Blue500.copyWith(
                            letterSpacing: getHorizontalSize(
                              0.20,
                            ),
                            height: getVerticalSize(
                              1.10,
                            ),
                          ),
                        ),
                        CustomImageView(
                          svgPath: ImageConstant.imgNext,
                          height: getSize(
                            16.00,
                          ),
                          width: getSize(
                            16.00,
                          ),
                          margin: getMargin(
                            left: 8,
                            top: 1,
                            bottom: 2,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Gallery

                  // Padding(
                  //   padding: getPadding(
                  //     left: 8,
                  //     top: 34,
                  //   ),
                  //   child: Text(
                  //     "lbl_gallery".tr,
                  //     overflow: TextOverflow.ellipsis,
                  //     textAlign: TextAlign.left,
                  //     style: AppStyle.txtManropeBold18.copyWith(
                  //       letterSpacing: getHorizontalSize(
                  //         0.20,
                  //       ),
                  //       height: getVerticalSize(
                  //         1.02,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // Padding(
                  //   padding: getPadding(
                  //     left: 8,
                  //     top: 13,
                  //   ),
                  //   child: Row(
                  //     children: [
                  //       CustomImageView(
                  //         imagePath: ImageConstant.imgPhoThoCourt,
                  //         height: getVerticalSize(
                  //           130.00,
                  //         ),
                  //         width: getHorizontalSize(
                  //           100.00,
                  //         ),
                  //       ),
                  //       CustomImageView(
                  //         imagePath: ImageConstant.imgCourt1,
                  //         height: getVerticalSize(
                  //           130.00,
                  //         ),
                  //         width: getHorizontalSize(
                  //           100.00,
                  //         ),
                  //         margin: getMargin(
                  //           left: 14,
                  //         ),
                  //         radius: BorderRadius.circular(
                  //           getHorizontalSize(
                  //             5.00,
                  //           ),
                  //         ),
                  //         alignment: Alignment.center,
                  //       ),
                  //       Container(
                  //         height: getVerticalSize(
                  //           130.00,
                  //         ),
                  //         width: getHorizontalSize(
                  //           100.00,
                  //         ),
                  //         margin: getMargin(
                  //           left: 14,
                  //         ),
                  //         child: Stack(
                  //           alignment: Alignment.center,
                  //           children: [
                  //             CustomImageView(
                  //               imagePath: ImageConstant.imgPhoThoCourt,
                  //               height: getVerticalSize(
                  //                 130.00,
                  //               ),
                  //               width: getHorizontalSize(
                  //                 100.00,
                  //               ),
                  //               radius: BorderRadius.circular(
                  //                 getHorizontalSize(
                  //                   5.00,
                  //                 ),
                  //               ),
                  //               alignment: Alignment.center,
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),

                  Container(
                    height: getVerticalSize(
                      1.00,
                    ),
                    width: getHorizontalSize(
                      327.00,
                    ),
                    margin: getMargin(
                      left: 8,
                      top: 24,
                    ),
                    decoration: BoxDecoration(
                      color: ColorConstant.gray300,
                    ),
                  ),

                  //review
                  Padding(
                    padding: getPadding(
                      left: 8,
                      top: 23,
                    ),
                    child: Row(
                      children: [
                        Text(
                          "lbl_reviews".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtManropeBold18.copyWith(
                            letterSpacing: getHorizontalSize(
                              0.20,
                            ),
                            height: getVerticalSize(
                              1.02,
                            ),
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            left: 154,
                            top: 4,
                            bottom: 3,
                          ),
                          child: Text(
                            "msg_view_all_reviews".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtManropeBold12Blue500.copyWith(
                              letterSpacing: getHorizontalSize(
                                0.40,
                              ),
                              height: getVerticalSize(
                                1.10,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      left: 8,
                      top: 14,
                    ),
                    child: Row(
                      children: [
                        Text(
                          "${controller.courtDetailsModelObj.value.ratingStar}".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtManropeBold32.copyWith(
                            letterSpacing: getHorizontalSize(
                              0.20,
                            ),
                            height: getVerticalSize(
                              0.92,
                            ),
                          ),
                        ),
                        CustomImageView(
                          svgPath: ImageConstant.imgStar,
                          height: getVerticalSize(
                            15.00,
                          ),
                          width: getHorizontalSize(
                            10.00,
                          ),
                          margin: getMargin(
                            left: 12,
                            top: 13,
                            bottom: 14,
                          ),
                        ),
                        CustomImageView(
                          svgPath: ImageConstant.imgStar,
                          height: getVerticalSize(
                            15.00,
                          ),
                          width: getHorizontalSize(
                            10.00,
                          ),
                          margin: getMargin(
                            left: 12,
                            top: 13,
                            bottom: 14,
                          ),
                        ),
                        CustomImageView(
                          svgPath: ImageConstant.imgStar,
                          height: getVerticalSize(
                            15.00,
                          ),
                          width: getHorizontalSize(
                            10.00,
                          ),
                          margin: getMargin(
                            left: 12,
                            top: 13,
                            bottom: 14,
                          ),
                        ),
                        CustomImageView(
                          svgPath: ImageConstant.imgStar,
                          height: getVerticalSize(
                            15.00,
                          ),
                          width: getHorizontalSize(
                            10.00,
                          ),
                          margin: getMargin(
                            left: 12,
                            top: 13,
                            bottom: 14,
                          ),
                        ),
                        CustomImageView(
                          svgPath: ImageConstant.imgStar,
                          height: getVerticalSize(
                            15.00,
                          ),
                          width: getHorizontalSize(
                            10.00,
                          ),
                          margin: getMargin(
                            left: 12,
                            top: 13,
                            bottom: 14,
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            left: 14,
                            top: 15,
                            bottom: 11,
                          ),
                          child: Text(
                            "100 ratings".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtManropeMedium12.copyWith(
                              letterSpacing: getHorizontalSize(
                                0.40,
                              ),
                              height: getVerticalSize(
                                1.10,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      left: 8,
                      top: 6,
                      right: 8,
                    ),
                    child: Obx(
                      () => ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: getVerticalSize(
                              3.00,
                            ),
                          );
                        },
                        itemCount: controller
                            .courtDetailsModelObj.value.listfiveItemList.length,
                        itemBuilder: (context, index) {
                          ListfiveItemModel model = controller
                              .courtDetailsModelObj
                              .value
                              .listfiveItemList[index];
                          return ListRatingItemWidget(
                            model,
                          );
                        },
                      ),
                    ),
                  ),
                  Container(
                    height: getVerticalSize(
                      1.00,
                    ),
                    width: getHorizontalSize(
                      315.00,
                    ),
                    margin: getMargin(
                      left: 8,
                      top: 24,
                    ),
                    decoration: BoxDecoration(
                      color: ColorConstant.gray300,
                    ),
                  ),
                  // button write a review
                  Container(
                    width: getHorizontalSize(
                      342.00,
                    ),
                    // color: Colors.black,
                    padding: getPadding(
                      top: 15,
                      bottom: 20,
                      right: 10,
                    ),
                    alignment: Alignment.center,
                    child: CustomButton(
                      height: 48,
                      width: 271,
                      text: "lbl_write_review".tr,
                      padding: ButtonPadding.PaddingAll12,
                      variant: ButtonVariant.OutlineGray300,
                      fontStyle: ButtonFontStyle.ManropeBold16,
                      onTap: () {
                        print("Write a review");
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ), onLoading: Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          height: 150,
          width: 50,
          padding: getPadding(top: 50),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: getPadding(right: 10),
                  child: const CircularProgressIndicator(),
                ),
                Padding(
                  padding: getPadding(top: 20),
                  child: Text("loading....",
                      style: AppStyle.txtManropeSemiBold16),
                ),
              ],
            ),),
        ),
      )),
        bottomNavigationBar: Container(
          width: size.width,
          padding: getPadding(
            left: 24,
            top: 13,
            right: 24,
            bottom: 13,
          ),
          decoration: AppDecoration.outlineBluegray1000f,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: getPadding(
                  top: 2,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: getPadding(
                        top: 4,
                        bottom: 3,
                      ),
                      child: Text(
                        "lbl_price".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtManropeMedium14.copyWith(
                          height: getVerticalSize(
                            1.10,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      "${controller.courtDetailsModelObj.value.moneyPerHour} VND",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtManropeExtraBold20.copyWith(
                        letterSpacing: getHorizontalSize(
                          0.20,
                        ),
                        height: getVerticalSize(
                          0.99,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // button Book now
              Padding(
                padding: getPadding(
                  top: 15,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomIconButton(
                      height: 44,
                      width: 44,
                      margin: getMargin(
                        top: 2,
                        bottom: 2,
                      ),
                      variant: IconButtonVariant.OutlineBluegray50,
                      child: CustomImageView(
                        svgPath: ImageConstant.imgFavorite,
                      ),
                      onTap: () {
                        print("Favorite");
                      },
                    ),
                    CustomButton(
                      height: 48,
                      width: 271,
                      text: "lbl_book_now".tr,
                      padding: ButtonPadding.PaddingAll12,
                      onTap: () {
                        print("Book now");
                        controller.chooseCourtScreen();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
