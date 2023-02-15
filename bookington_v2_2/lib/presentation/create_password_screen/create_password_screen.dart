import 'controller/create_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/core/utils/validation_functions.dart';
import 'package:bookington_v2_2/widgets/custom_button.dart';
import 'package:bookington_v2_2/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class CreatePasswordScreen extends GetWidget<CreatePasswordController> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: ColorConstant.whiteA700,
            body: Form(
                key: _formKey,
                child: Container(
                    width: size.width,
                    padding: getPadding(left: 16, right: 16),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              width: getHorizontalSize(358.00),
                              margin: getMargin(left: 8),
                              child: Text("msg_create_password".tr,
                                  maxLines: null,
                                  textAlign: TextAlign.center,
                                  style: AppStyle.txtManropeBold32.copyWith(
                                      letterSpacing: getHorizontalSize(0.72),
                                      height: getVerticalSize(1.22)))),
                          Container(
                              width: getHorizontalSize(358.00),
                              margin: getMargin(top: 15),
                              padding: getPadding(
                                  left: 23, top: 8, right: 23, bottom: 8),
                              decoration: AppDecoration.fillBluegray50.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder8),
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Obx(() => CustomTextFormField(
                                        width: 310,
                                        controller: controller.txtPassword,
                                        hintText: "msg_enter_your_password".tr,
                                        margin: getMargin(top: 5),
                                        variant: TextFormFieldVariant.None,
                                        padding: TextFormFieldPadding.PaddingT1,
                                        textInputAction: TextInputAction.done,
                                        textInputType:
                                            TextInputType.visiblePassword,
                                        suffix: InkWell(
                                            onTap: () {
                                              controller.isShowPassword.value =
                                                  !controller
                                                      .isShowPassword.value;
                                            },
                                            child: Container(
                                                margin: getMargin(left: 20),
                                                child: CustomImageView(
                                                    width: 32,
                                                    svgPath: controller
                                                            .isShowPassword
                                                            .value
                                                        ? ImageConstant
                                                            .imgHideEye
                                                        : ImageConstant
                                                            .imgEye))),
                                        suffixConstraints: BoxConstraints(
                                            maxHeight: getVerticalSize(32.00)),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return "Please enter valid password";
                                          }
                                          return null;
                                        },
                                        isObscureText:
                                            !controller.isShowPassword.value))
                                  ])),

                          Container(
                              width: getHorizontalSize(358.00),
                              margin: getMargin(top: 15),
                              padding: getPadding(
                                  left: 23, top: 8, right: 23, bottom: 8),
                              decoration: AppDecoration.fillBluegray50.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder8),
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Obx(() => CustomTextFormField(
                                        width: 310,
                                        controller:
                                            controller.txtPasswordConfirm,
                                        hintText: "msg_enter_your_password".tr,
                                        margin: getMargin(top: 5),
                                        variant: TextFormFieldVariant.None,
                                        padding: TextFormFieldPadding.PaddingT1,
                                        textInputAction: TextInputAction.done,
                                        textInputType:
                                            TextInputType.visiblePassword,
                                        suffix: InkWell(
                                            onTap: () {
                                              controller.isShowConfirm.value =
                                                  !controller
                                                      .isShowConfirm.value;
                                            },
                                            child: Container(
                                                margin: getMargin(left: 20),
                                                child: CustomImageView(
                                                    width: 32,
                                                    svgPath: controller
                                                            .isShowConfirm.value
                                                        ? ImageConstant
                                                            .imgHideEye
                                                        : ImageConstant
                                                            .imgEye))),
                                        suffixConstraints: BoxConstraints(
                                            maxHeight: getVerticalSize(32.00)),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return "Please enter match password";
                                          }
                                          return null;
                                        },
                                        isObscureText:
                                            !controller.isShowConfirm.value))
                                  ])),
                          //login button
                          CustomButton(
                            height: 53,
                            width: 358,
                            text: "lbl_confirm".tr,
                            margin: getMargin(top: 24),
                            onTap: () {
                              controller.createPassword();

                            },
                          ),
                        ])))));
  }
}
