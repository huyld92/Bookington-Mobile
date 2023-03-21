

import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/core/utils/validation_functions.dart';
import 'package:bookington_v2_2/presentation/create_new_password_screen/controller/create_new_password_controller.dart';
import 'package:bookington_v2_2/widgets/app_bar/appbar_image.dart';
import 'package:bookington_v2_2/widgets/app_bar/appbar_title.dart';
import 'package:bookington_v2_2/widgets/app_bar/custom_app_bar.dart';
import 'package:bookington_v2_2/widgets/custom_button.dart';
import 'package:bookington_v2_2/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class CreateNewPasswordScreen extends GetWidget<CreateNewPasswordController>{
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  CreateNewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          appBar: CustomAppBar(
            height: getVerticalSize(80),
            leadingWidth: 64,
            leading: AppbarImage(
              height: getVerticalSize(64),
              width: getVerticalSize(64),
              svgPath: ImageConstant.imgArrowLeft,
              margin: getMargin(left: 24),
              onTap: () {
                controller.getBack();
              },
            ),
            centerTitle: true,
            title: AppbarTitle(text: "Bookington".tr),
          ),
          resizeToAvoidBottomInset: false,
          backgroundColor: ColorConstant.whiteA700,
          body: GestureDetector(
            onTap: () {
               FocusScope.of(context).requestFocus(FocusNode());
            },
            child: Form(
              key: _formKey,
              child: Container(
                width: size.width,
                padding: getPadding(left: 16, right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomImageView(
                      height: 128,
                      width: 128,
                      margin: getMargin(bottom: 30),
                      svgPath: ImageConstant.imgResetPassword,
                    ),
                    SizedBox(
                        width: getHorizontalSize(350.00),
                        child: Text("lbl_create_password".tr,
                            maxLines: null,
                            textAlign: TextAlign.center,
                            style: AppStyle.txtManropeExtraBold24.copyWith(
                                letterSpacing: getHorizontalSize(0.72),
                                height: getVerticalSize(1.22)))),

                    SizedBox(
                        height: getVerticalSize(80),
                        width: getHorizontalSize(358.00),
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Obx(() => CustomTextFormField(
                                  width: 310,
                                  controller: controller.txtPasswordController,
                                  hintText: "msg_enter_your_password".tr,
                                  variant: TextFormFieldVariant.OutlineGray300,
                                  padding: TextFormFieldPadding.PaddingT14L20,
                                  textInputAction: TextInputAction.done,
                                  textInputType: TextInputType.visiblePassword,
                                  suffix: InkWell(
                                      onTap: () {
                                        controller.isShowPassword.value =
                                        !controller.isShowPassword.value;
                                      },
                                      child: Container(
                                          margin: getMargin(right: 20),
                                          child: CustomImageView(
                                              width: 28,
                                              svgPath:
                                              controller.isShowPassword.value
                                                  ? ImageConstant.imgHideEye
                                                  : ImageConstant.imgEye))),
                                  suffixConstraints: BoxConstraints(
                                      maxHeight: getVerticalSize(28.00)),
                                  validator: (value) {
                                    if (value == null || (!isValidPassword(value,
                                        isRequired: true))) {
                                      return "The password at least 6 characters";
                                    }
                                    return null;
                                  },
                                  isObscureText:
                                  !controller.isShowPassword.value)),
                            ])),
                    SizedBox(
                      height: getVerticalSize(80),
                      width: getHorizontalSize(358.00),
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Obx(() => CustomTextFormField(
                                width: 310,
                                controller: controller.txtPasswordConfirm,
                                hintText: "msg_enter_confirm_password".tr,
                                variant: TextFormFieldVariant.OutlineGray300,
                                padding: TextFormFieldPadding.PaddingT14L20,
                                textInputAction: TextInputAction.done,
                                textInputType: TextInputType.visiblePassword,
                                suffix: InkWell(
                                    onTap: () {
                                      controller.isShowConfirm.value =
                                      !controller.isShowConfirm.value;
                                    },
                                    child: Container(
                                        margin: getMargin(right: 20),
                                        child: CustomImageView(
                                            width: 28,
                                            svgPath:
                                            controller.isShowConfirm.value
                                                ? ImageConstant.imgHideEye
                                                : ImageConstant.imgEye))),
                                suffixConstraints: BoxConstraints(
                                    maxHeight: getVerticalSize(28.00)),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Please enter match password!";
                                  } else if (controller
                                      .txtPasswordConfirm.value !=
                                      controller.txtPasswordController.value) {
                                    return "Please enter match password";
                                  }
                                  return null;
                                },
                                isObscureText: !controller.isShowConfirm.value))
                          ]),
                    ),

                    //login button
                    CustomButton(
                      height: 55,
                      width: 310,
                      text: "lbl_save".tr,
                      margin: getMargin(top: 24),
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {
                          controller.createNewPassword();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),),
    );
  }

}