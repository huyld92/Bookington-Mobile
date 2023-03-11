import 'package:bookington_v2_2/presentation/profile_screen/widgets/log_out_pop_up_dialog.dart';
import 'package:bookington_v2_2/widgets/app_bar/appbar_title.dart';
import 'package:bookington_v2_2/widgets/app_bar/custom_app_bar.dart';
import 'package:bookington_v2_2/widgets/custom_bottom_bar.dart';
import 'package:bookington_v2_2/widgets/custom_icon_button.dart';

import 'controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:bookington_v2_2/core/app_export.dart';

// ignore_for_file: must_be_immutable
class ProfileScreen extends GetWidget<ProfileController> {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CustomBottomBar.selectedIndex = 4.obs;

    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.gray50,
        appBar: CustomAppBar(
          height: getVerticalSize(80.00),
          leadingWidth: 64,
          centerTitle: true,
          title: AppbarTitle(text: "lbl_profile".tr),
        ),
        body: SingleChildScrollView(
          child: Container(
            width: size.width,
            padding: getPadding(left: 24, right: 24, bottom: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      // margin: getMargin(left: 30),
                      height: getSize(70.00),
                      width: getSize(70.00),
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          CustomImageView(
                              svgPath: ImageConstant.imgUser,
                              height: getSize(70.00),
                              width: getSize(70.00),
                              radius: BorderRadius.circular(
                                  getHorizontalSize(35.00)),
                              alignment: Alignment.center),
                          // CustomIconButton(
                          //   height: 24,
                          //   width: 24,
                          //   variant: IconButtonVariant.FillBlue400,
                          //   padding: IconButtonPadding.PaddingAll6,
                          //   alignment: Alignment.bottomRight,
                          //   child: CustomImageView(
                          //     height: 24,
                          //     width: 24,
                          //     svgPath: ImageConstant.imgEdit,
                          //     color: ColorConstant.whiteA700,
                          //   ),
                          //   onTap: () {
                          //     print('update image');
                          //     // controller.editProfileScreen();
                          //   },
                          // )
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: getPadding(top: 8),
                          child: Obx(
                            () => Text(
                                controller.profileModelObj.value.fullName,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtManropeBold16.copyWith(
                                    letterSpacing: getHorizontalSize(0.20))),
                          ),
                        ),
                        Padding(
                            padding: getPadding(top: 4),
                            child: Text("2.000.000d",
                                // controller.profileModelObj.value.phomeNumber,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtManropeBold16)),
                      ],
                    )
                  ],
                ),
                //manage
                GestureDetector(
                  onTap: () {
                    controller.editProfileScreen();
                  },
                  child: Padding(
                      padding: getPadding(top: 10),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomIconButton(
                                height: 40,
                                width: 40,
                                child: CustomImageView(
                                    svgPath: ImageConstant.imgUserProfile)),
                            Padding(
                                padding:
                                    getPadding(left: 16, top: 10, bottom: 7),
                                child: Text("lbl_manage_your_account".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtManropeSemiBold14)),
                            const Spacer(),
                            CustomImageView(
                                svgPath: ImageConstant.imgArrowright,
                                height: getSize(20.00),
                                width: getSize(20.00),
                                margin: getMargin(top: 10))
                          ])),
                ),
                //Wallet
                GestureDetector(
                  onTap: () {
                    controller.walletScreen();
                  },
                  child: Padding(
                    padding: getPadding(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomIconButton(
                          height: 40,
                          width: 40,
                          child:
                              CustomImageView(svgPath: ImageConstant.imgWallet),
                        ),
                        Padding(
                            padding: getPadding(left: 16, top: 10, bottom: 7),
                            child: Text("lbl_wallet".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtManropeSemiBold14)),
                        const Spacer(),
                        CustomImageView(
                            svgPath: ImageConstant.imgArrowright,
                            height: getSize(20.00),
                            width: getSize(20.00),
                            margin: getMargin(top: 10))
                      ],
                    ),
                  ),
                ),
                //favorite
                GestureDetector(
                  onTap: () {
                    controller.favouriteCourt();
                  },
                  child: Padding(
                      padding: getPadding(top: 10),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomIconButton(
                                height: 40,
                                width: 40,
                                child: CustomImageView(
                                    svgPath: ImageConstant.imgFavorite)),
                            Padding(
                                padding:
                                    getPadding(left: 16, top: 10, bottom: 7),
                                child: Text("lbl_my_favorites".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtManropeSemiBold14)),
                            const Spacer(),
                            CustomImageView(
                                svgPath: ImageConstant.imgArrowright,
                                height: getSize(20.00),
                                width: getSize(20.00),
                                margin: getMargin(top: 10))
                          ])),
                ),
                // Align(
                //     alignment: Alignment.centerLeft,
                //     child: Padding(
                //         padding: getPadding(top: 20),
                //         child: Text("lbl_help_and_suppport".tr,
                //             overflow: TextOverflow.ellipsis,
                //             textAlign: TextAlign.left,
                //             style: AppStyle.txtManropeExtraBold14.copyWith(
                //                 letterSpacing: getHorizontalSize(0.20))))),
                Padding(
                    padding: getPadding(top: 10),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomIconButton(
                              height: 40,
                              width: 40,
                              child: CustomImageView(
                                  svgPath: ImageConstant.imgNotFound)),
                          Padding(
                              padding: getPadding(left: 16, top: 10, bottom: 7),
                              child: Text("lbl_report".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtManropeSemiBold14)),
                          const Spacer(),
                          CustomImageView(
                            svgPath: ImageConstant.imgArrowright,
                            height: getSize(20.00),
                            width: getSize(20.00),
                            margin: getMargin(top: 10, bottom: 10),
                            onTap: () {
                              controller.sendReport();
                            },
                          )
                        ])),

                GestureDetector(
                  onTap: () {
                    controller.transactionScreen();
                  },
                  child: Padding(
                    padding: getPadding(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomIconButton(
                            height: 40,
                            width: 40,
                            child: CustomImageView(
                                svgPath: ImageConstant.imgNotFound)),
                        Padding(
                            padding: getPadding(left: 16, top: 10, bottom: 9),
                            child: Text("lbl_transaction".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtManropeSemiBold14)),
                        const Spacer(),
                        CustomImageView(
                            svgPath: ImageConstant.imgArrowright,
                            height: getSize(20.00),
                            width: getSize(20.00),
                            margin: getMargin(top: 10)),
                      ],
                    ),
                  ),
                ),
                // Align(
                //     alignment: Alignment.centerLeft,
                //     child: Padding(
                //         padding: getPadding(top: 15),
                //         child: Text("lbl_setting_and_legal".tr,
                //             overflow: TextOverflow.ellipsis,
                //             textAlign: TextAlign.left,
                //             style: AppStyle.txtManropeExtraBold14.copyWith(
                //                 letterSpacing: getHorizontalSize(0.20))))),
                GestureDetector(
                  onTap: () {
                    controller.test();
                  },
                  child: Padding(
                      padding: getPadding(top: 10),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomIconButton(
                                height: 40,
                                width: 40,
                                child: CustomImageView(
                                    svgPath: ImageConstant.imgNotFound)),
                            Padding(
                                padding:
                                    getPadding(left: 16, top: 10, bottom: 7),
                                child: Text("Test".tr,
                                    // child: Text("lbl_change_password".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtManropeSemiBold14)),
                            const Spacer(),
                            CustomImageView(
                                svgPath: ImageConstant.imgArrowright,
                                height: getSize(20.00),
                                width: getSize(20.00),
                                margin: getMargin(top: 10, bottom: 10))
                          ])),
                ),
                Padding(
                  padding: getPadding(top: 10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomIconButton(
                            height: 40,
                            width: 40,
                            child: CustomImageView(
                                svgPath: ImageConstant.imgSetting)),
                        Padding(
                            padding: getPadding(left: 16, top: 12, bottom: 7),
                            child: Text("lbl_settings".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtManropeSemiBold14)),
                        const Spacer(),
                        CustomImageView(
                            svgPath: ImageConstant.imgArrowright,
                            height: getSize(20.00),
                            width: getSize(20.00),
                            margin: getMargin(top: 10, bottom: 10))
                      ]),
                ),
                GestureDetector(
                  onTap: () {
                    Get.defaultDialog(
                      title: "",
                      content: LogOutPopUpDialog(controller),
                    );
                  },
                  child: Padding(
                    padding: getPadding(top: 10),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomIconButton(
                            height: 40,
                            width: 40,
                            child: CustomImageView(
                              svgPath: ImageConstant.imgLogout,
                              color: ColorConstant.red500,
                            ),
                          ),
                          Padding(
                              padding: getPadding(left: 16, top: 12, bottom: 7),
                              child: Text("lbl_logout".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtManropeSemiBold14Red500)),
                          const Spacer(),
                          CustomImageView(
                              svgPath: ImageConstant.imgArrowright,
                              height: getSize(20.00),
                              width: getSize(20.00),
                              margin: getMargin(top: 10, bottom: 10))
                        ]),
                  ),
                )
              ],
            ),
          ),
        ),
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
      case BottomBarEnum.Search:
        return AppRoutes.searchScreen;
      case BottomBarEnum.History:
        return AppRoutes.historyScreen;
      case BottomBarEnum.Profile:
        return AppRoutes.profileScreen;
      default:
        return "/";
    }
  }
}
