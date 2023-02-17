import 'package:bookington_v2_2/presentation/home_screen/home_screen.dart';
import 'package:bookington_v2_2/widgets/custom_bottom_bar.dart';

import 'controller/message_chat_controller.dart';
import 'package:flutter/material.dart';
import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/widgets/app_bar/appbar_iconbutton.dart';
import 'package:bookington_v2_2/widgets/app_bar/custom_app_bar.dart';
import 'package:bookington_v2_2/widgets/custom_button.dart';
import 'package:bookington_v2_2/widgets/custom_icon_button.dart';

class MessageChatScreen extends GetWidget<MessageChatController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        backgroundColor: ColorConstant.gray50,
        appBar: CustomAppBar(
          height: getVerticalSize(56.00),
          leadingWidth: 90,
          leading: AppbarIconbutton(
              svgPath: ImageConstant.imgArrowleft,
              margin: getMargin(left: 24, top: 10, bottom: 9, right: 20),
              onTap: controller.getBack()),
          centerTitle: true,
          title: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Row(children: [
              Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Phu Tho Court Ow".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtManropeBold18
                            .copyWith(letterSpacing: getHorizontalSize(0.10)))),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                        padding: getPadding(top: 2, right: 56),
                        child: Text("lbl_online".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtManropeMedium12Green500.copyWith(
                                letterSpacing: getHorizontalSize(0.40)))))
              ]),
              AppbarIconbutton(
                  svgPath: ImageConstant.imgUser,
                  margin: getMargin(left: 70, bottom: 3))
            ])
          ]),
        ),
        body: Container(
            width: size.width,
            padding: getPadding(top: 14, bottom: 14),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      height: getVerticalSize(1.00),
                      width: size.width,
                      decoration: BoxDecoration(color: ColorConstant.gray300)),
                  Align(
                      alignment: Alignment.center,
                      child: Padding(
                          padding: getPadding(top: 16),
                          child: Text("lbl_today".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtManropeSemiBold12.copyWith(
                                  letterSpacing: getHorizontalSize(0.40))))),
                  CustomButton(
                      height: 53,
                      width: 97,
                      text: "Hia a aa a".tr,
                      margin: getMargin(top: 15, right: 24),
                      variant: ButtonVariant.FillBlue50,
                      shape: ButtonShape.CustomBorderTL10,
                      fontStyle: ButtonFontStyle.ManropeMedium14),
                  Container(
                      width: getHorizontalSize(264.00),
                      margin: getMargin(top: 8, right: 24),
                      padding: getPadding(all: 16),
                      decoration: AppDecoration.fillBlue50.copyWith(
                          borderRadius: BorderRadiusStyle.customBorderTL10),
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                width: getHorizontalSize(218.00),
                                child: Text("asdasdsad".tr,
                                    maxLines: null,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtManropeMedium14))
                          ])),
                  Padding(
                      padding: getPadding(top: 5, right: 24),
                      child: Text("12:13".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtManropeRegular12.copyWith(
                              letterSpacing: getHorizontalSize(0.40)))),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                          width: getHorizontalSize(210.00),
                          margin: getMargin(left: 24, top: 15),
                          padding: getPadding(
                              left: 16, top: 13, right: 16, bottom: 13),
                          decoration: AppDecoration.fillBluegray50.copyWith(
                              borderRadius: BorderRadiusStyle.customBorderTL10),
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    width: getHorizontalSize(154.00),
                                    margin: getMargin(top: 4),
                                    child: Text("sadascascasc".tr,
                                        maxLines: null,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtManropeMedium14))
                              ]))),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: getPadding(left: 24, top: 5),
                          child: Text("12:15".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtManropeRegular12.copyWith(
                                  letterSpacing: getHorizontalSize(0.40))))),
                  Container(
                      width: getHorizontalSize(264.00),
                      margin: getMargin(top: 15, right: 24),
                      padding:
                          getPadding(left: 16, top: 13, right: 16, bottom: 13),
                      decoration: AppDecoration.fillBlue50.copyWith(
                          borderRadius: BorderRadiusStyle.customBorderTL10),
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                width: getHorizontalSize(222.00),
                                margin: getMargin(top: 4),
                                child: Text("dasdasdsad".tr,
                                    maxLines: null,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtManropeMedium14))
                          ])),
                  Padding(
                      padding: getPadding(top: 5, right: 24),
                      child: Text("12:18".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtManropeRegular12.copyWith(
                              letterSpacing: getHorizontalSize(0.40)))),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                          width: getHorizontalSize(176.00),
                          margin: getMargin(left: 24, top: 15),
                          padding: getPadding(
                              left: 16, top: 13, right: 16, bottom: 13),
                          decoration: AppDecoration.fillBluegray50.copyWith(
                              borderRadius: BorderRadiusStyle.customBorderTL10),
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    width: getHorizontalSize(140.00),
                                    margin: getMargin(top: 4),
                                    child: Text("acsascascascas".tr,
                                        maxLines: null,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtManropeMedium14))
                              ]))),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: getPadding(left: 24, top: 5, bottom: 5),
                          child: Text("12:19".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtManropeRegular12.copyWith(
                                  letterSpacing: getHorizontalSize(0.40)))))
                ])),
        bottomNavigationBar: Container(
          width: size.width,
          decoration: AppDecoration.outlineBluegray1000f,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  width: size.width,
                  padding: getPadding(left: 24, top: 16, right: 24, bottom: 16),
                  decoration: AppDecoration.outlineBluegray1000f,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            padding: getPadding(
                                left: 16, top: 15, right: 16, bottom: 15),
                            decoration: AppDecoration.fillBluegray50.copyWith(
                                borderRadius:
                                    BorderRadiusStyle.roundedBorder10),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomImageView(
                                      // svgPath: ImageConstant.imgPlus,
                                      height: getSize(22.00),
                                      width: getSize(22.00),
                                      margin: getMargin(top: 1, bottom: 1)),
                                  Padding(
                                      padding: getPadding(left: 12, top: 4),
                                      child: Text("Write a reply...".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtManropeRegular14)),
                                  CustomImageView(
                                      svgPath: ImageConstant.imgCamera,
                                      height: getSize(24.00),
                                      width: getSize(24.00),
                                      margin: getMargin(left: 83),
                                      onTap: () {
                                        onTapImgCamera();
                                      })
                                ])),
                        CustomIconButton(
                            height: 56,
                            width: 56,
                            variant: IconButtonVariant.FillBlue500,
                            padding: IconButtonPadding.PaddingAll16,
                            child:
                                CustomImageView(svgPath: ImageConstant.imgSend))
                      ]))
            ],
          ),
        ),
      ),
    );
  }

  onTapImgCamera() async {
    await PermissionManager.askForPermission(Permission.camera);
    await PermissionManager.askForPermission(Permission.storage);
    List<String?>? imageList = [];
    // await FileManager().showModelSheetForImage(getImages: (value) async {
    //   imageList = value;
    // });
  }

  onTapArrowleft() {
    print("Chat sreen back");
    // Get.back();
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return AppRoutes.homeScreen;
      case BottomBarEnum.Message:
        return AppRoutes.messageChatScreen;
      case BottomBarEnum.Search:
        return AppRoutes.searchScreen;
      case BottomBarEnum.History:
        return AppRoutes.homeScreen;
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
        return MessageChatScreen();
      default:
        return DefaultWidget();
    }
  }
}
