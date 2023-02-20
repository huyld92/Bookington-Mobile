import 'package:bookington_v2_2/presentation/home_screen/widgets/court_item_widget.dart';

import 'controller/home_controller.dart';
import 'models/home_item_model.dart';
import 'package:flutter/material.dart';
import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/widgets/app_bar/appbar_image.dart';
import 'package:bookington_v2_2/widgets/app_bar/custom_app_bar.dart';
import 'package:bookington_v2_2/widgets/custom_bottom_bar.dart';
import 'package:bookington_v2_2/widgets/custom_icon_button.dart';

class HomeScreen extends GetWidget<HomeController> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: ColorConstant.gray50,
        appBar: CustomAppBar(
          height: getVerticalSize(
            60.00,
          ),
          title: Row(
            children: [
              Padding(
                padding: getPadding(
                  left: 24,
                  top: 10,
                  bottom: 9,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: getPadding(
                        top: 6,
                      ),
                      child: Row(
                        children: [
                          AppbarImage(
                            height: getSize(
                              32.00,
                            ),
                            width: getSize(
                              32.00,
                            ),
                            svgPath: ImageConstant.imgUser,
                            margin: getMargin(
                              bottom: 3,
                              right: 10,
                            ),
                          ),
                          Text(
                            controller.homeModelObj.value.fullName,
                            style: TextStyle(color: ColorConstant.black900),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          actions: [
            Stack(
              children: [
                CustomIconButton(
                  height: 40,
                  width: 40,
                  margin: getMargin(
                    left: 12,
                    top: 10,
                    right: 24,
                    bottom: 10,
                  ),
                  variant: IconButtonVariant.OutlineBluegray50,
                  child: CustomImageView(
                    svgPath: ImageConstant.imgNotify,
                  ),
                  onTap: () {
                    print("onTap notification");
                  },
                ),
                Positioned(
                    top: 10,
                    right: 30,
                    child: Container(
                      height: 16,
                      width: 16,
                      decoration: BoxDecoration(
                        color: Color(0xFFFF4848),
                        shape: BoxShape.circle,
                        border: Border.all(width: 1.5, color: Colors.white),
                      ),
                      child: Center(
                          child: Text(
                        "3",
                        style: TextStyle(
                            fontSize: 10,
                            height: 1,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      )),
                    ))
              ],
            )
          ],
          styleType: Style.bgFillGray50,
        ),
        body: SizedBox(
            width: size.width,
            child: Column(
              children: [
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    width: double.infinity,
                    height: 120,
                    child: CustomImageView(
                      width: double.infinity,
                      height: 120,
                      imagePath: ImageConstant.imgMomoAds,),
                    ),
                //Recommend see more
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  width: double.infinity,
                  // height: 120,
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "lbl_recommend".tr,
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
                      Spacer(),
                      InkWell(
                        child: new Row(
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
                              color: ColorConstant.blue500,
                            ),
                          ],
                        ),
                        onTap: () {
                          print("onTap see more");
                          controller.goRecommendScreen();
                        },
                      )
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    margin: getMargin(left: 20),
                    height: getVerticalSize(
                      430.00,
                    ),
                    child: Obx(
                      () => ListView.separated(
                        padding: getPadding(
                          top: 10,
                        ),
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: getVerticalSize(
                              24.00,
                            ),
                          );
                        },
                        itemCount:
                            controller.homeModelObj.value.homeItemList.length,
                        itemBuilder: (context, index) {
                          HomeItemModel model =
                              controller.homeModelObj.value.homeItemList[index];
                          return CourtItemWidget(
                            model,
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            )),
        bottomNavigationBar: CustomBottomBar(
          onChanged: (BottomBarEnum type) {
            Get.toNamed(getCurrentRoute(type));
          },
        ),
      ),
    );
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return AppRoutes.homeScreen;
      case BottomBarEnum.Message:
        return AppRoutes.messagesScreen;
      case BottomBarEnum.Message:
        return AppRoutes.searchScreen;
      case BottomBarEnum.History:
        return AppRoutes.historyScreen;
      case BottomBarEnum.Profile:
        return AppRoutes.profileScreen;
      default:
        return "/";
    }
  }

  // /Handling page based on route
  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
       case AppRoutes.homeScreen:
        return HomeScreen();
       default:
        return HomeScreen();
    }
  }
}
