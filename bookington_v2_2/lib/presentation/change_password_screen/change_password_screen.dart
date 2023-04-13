import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/presentation/change_password_screen/controller/change_password_controller.dart';
import 'package:bookington_v2_2/widgets/app_bar/appbar_image.dart';
import 'package:bookington_v2_2/widgets/app_bar/appbar_title.dart';
import 'package:bookington_v2_2/widgets/app_bar/custom_app_bar.dart';
import 'package:bookington_v2_2/widgets/custom_button.dart';
import 'package:bookington_v2_2/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class ChangePasswordScreen extends GetWidget<ChangePasswordController> {
  ChangePasswordScreen({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
            title: AppbarTitle(text: "lbl_change_password".tr),
          ),
          body: controller.obx(
            (state) => SingleChildScrollView(
              child: SizedBox(
                width: size.width,
                height: size.height - 22,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomImageView(
                      height: getHorizontalSize(64),
                      svgPath: ImageConstant.imgResetPassword,
                     ),
                    Container(
                       padding:
                          getPadding(left: 20, top: 31, right: 20, bottom: 31),
                      child: Form(
                        key: _formKey,
                        child: Container(
                          width: size.width,
                          padding: getPadding(left: 16, right: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 80,
                                width: getHorizontalSize(358.00),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Obx(() => CustomTextFormField(
                                        width: 310,
                                        controller:
                                            controller.txtOldPasswordController,
                                        hintText: "msg_old_password".tr,
                                        variant:
                                            TextFormFieldVariant.OutlineGray300,
                                        padding:
                                            TextFormFieldPadding.PaddingT14L20,
                                        textInputAction: TextInputAction.done,
                                        textInputType:
                                            TextInputType.visiblePassword,
                                        suffix: InkWell(
                                            onTap: () {
                                              controller
                                                      .isShowOldPassword.value =
                                                  !controller
                                                      .isShowOldPassword.value;
                                            },
                                            child: CustomImageView(
                                                margin: getMargin(right: 20),
                                                width: 28,
                                                svgPath: controller
                                                        .isShowOldPassword.value
                                                    ? ImageConstant.imgHideEye
                                                    : ImageConstant.imgEye)),
                                        suffixConstraints: BoxConstraints(
                                            maxHeight: getVerticalSize(28.00)),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return "Please enter valid password";
                                          }
                                          return null;
                                        },
                                        isObscureText: !controller
                                            .isShowOldPassword.value))
                                  ],
                                ),
                              ),
                              //new
                              SizedBox(
                                height: 80,
                                width: getHorizontalSize(358.00),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Obx(() => CustomTextFormField(
                                        width: 310,
                                        controller:
                                            controller.txtNewPasswordController,
                                        hintText: "msg_new_password".tr,
                                        variant:
                                            TextFormFieldVariant.OutlineGray300,
                                        padding:
                                            TextFormFieldPadding.PaddingT14L20,
                                        textInputAction: TextInputAction.done,
                                        textInputType:
                                            TextInputType.visiblePassword,
                                        suffix: InkWell(
                                            onTap: () {
                                              controller
                                                      .isShowNewPassword.value =
                                                  !controller
                                                      .isShowNewPassword.value;
                                            },
                                            child: CustomImageView(
                                                margin: getMargin(right: 20),
                                                width: 28,
                                                svgPath: controller
                                                        .isShowNewPassword.value
                                                    ? ImageConstant.imgHideEye
                                                    : ImageConstant.imgEye)),
                                        suffixConstraints: BoxConstraints(
                                            maxHeight: getVerticalSize(28.00)),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return "Please enter valid password";
                                          }
                                          return null;
                                        },
                                        isObscureText: !controller
                                            .isShowNewPassword.value))
                                  ],
                                ),
                              ),
                              //confirm
                              SizedBox(
                                height: 80,
                                width: getHorizontalSize(358.00),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Obx(() => CustomTextFormField(
                                        width: 310,
                                        controller:
                                            controller.txtConfirmController,
                                        hintText:
                                            "msg_enter_confirm_password".tr,
                                        variant:
                                            TextFormFieldVariant.OutlineGray300,
                                        padding:
                                            TextFormFieldPadding.PaddingT14L20,
                                        textInputAction: TextInputAction.done,
                                        textInputType:
                                            TextInputType.visiblePassword,
                                        suffix: InkWell(
                                            onTap: () {
                                              controller.isShowConfirmPassword
                                                      .value =
                                                  !controller
                                                      .isShowConfirmPassword
                                                      .value;
                                            },
                                            child: CustomImageView(
                                                margin: getMargin(right: 20),
                                                width: 28,
                                                svgPath: controller
                                                        .isShowConfirmPassword
                                                        .value
                                                    ? ImageConstant.imgHideEye
                                                    : ImageConstant.imgEye)),
                                        suffixConstraints: BoxConstraints(
                                            maxHeight: getVerticalSize(28.00)),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return "Please enter valid password";
                                          }
                                          return null;
                                        },
                                        isObscureText: !controller
                                            .isShowConfirmPassword.value))
                                  ],
                                ),
                              ),
                              //login button
                              CustomButton(
                                height: 55,
                                width: 310,
                                text: "lbl_save".tr,
                                margin: getMargin(top: 20),
                                onTap: () async {
                                  if (_formKey.currentState!.validate()) {
                                    controller.changePassword();
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            onLoading: Dialog(
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
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
