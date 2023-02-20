import 'package:flutter/gestures.dart';

import 'controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/core/utils/validation_functions.dart';
import 'package:bookington_v2_2/widgets/custom_button.dart';
import 'package:bookington_v2_2/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class LoginScreen extends GetWidget<LoginController> {
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
                              width: getHorizontalSize(261.00),
                              margin: getMargin(left: 8),
                              child: Text("msg_welcome_back_glad".tr,
                                  maxLines: null,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtManropeExtraBold24
                                      .copyWith(
                                          letterSpacing:
                                              getHorizontalSize(0.72),
                                          height: getVerticalSize(1.22)))),
                          Container(
                              width: getHorizontalSize(358.00),
                              margin: getMargin(top: 15),
                              padding: getPadding(
                                  left: 23, top: 8, right: 23, bottom: 8),
                              decoration: AppDecoration.fillGray300.copyWith(
                                  // decoration: AppDecoration.fillGray300.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder8),
                              // BorderRadiusStyle.roundedBorder8),
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    CustomTextFormField(
                                      width: 310,
                                      focusNode: FocusNode(),
                                      controller: controller.txtPhoneController,
                                      hintText: "msg_enter_your_phone".tr,
                                      margin: getMargin(top: 5),
                                      variant: TextFormFieldVariant.None,
                                      padding: TextFormFieldPadding.PaddingT1,
                                      textInputAction: TextInputAction.none,
                                      textInputType: TextInputType.phone,
                                      suffixConstraints: BoxConstraints(
                                          maxHeight: getVerticalSize(32.00)),
                                      validator: (value) {
                                        if (value == null ||
                                            (!isValidPhone(value,
                                                isRequired: true))) {
                                          return "Please enter valid phone";
                                        }
                                        return null;
                                      },
                                    )
                                  ])),

                          Container(
                              width: getHorizontalSize(358.00),
                              margin: getMargin(top: 15),
                              padding: getPadding(
                                  left: 23, top: 8, right: 23, bottom: 8),
                              decoration: AppDecoration.fillGray300.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder8),
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Obx(() => CustomTextFormField(
                                        width: 310,
                                        controller:
                                            controller.txtPasswordController,
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
                          //login button
                          CustomButton(
                            height: 53,
                            width: 358,
                            text: "lbl_login".tr,
                            margin: getMargin(top: 24),

                            onTap: () async {
                              if (_formKey.currentState!.validate()) {
                                controller.login(
                                    controller.txtPhoneController.text,
                                    controller.txtPasswordController.text);
                              }
                            },
                          ),
                          Padding(
                            padding: getPadding(),
                            child: Text("lbl_forgot_pasword"),
                          ),
                          Align(
                              alignment: Alignment.center,
                              child: Padding(
                                  padding: getPadding(top: 43, bottom: 5),
                                  child: RichText(
                                      text: TextSpan(children: [
                                        TextSpan(
                                            text:
                                                "msg_don_t_have_an_account2".tr,
                                            style: TextStyle(
                                                color: ColorConstant.gray90001,
                                                fontSize: getFontSize(14),
                                                fontFamily: 'Lato',
                                                fontWeight: FontWeight.w400,
                                                height: getVerticalSize(1.25))),
                                        TextSpan(
                                            text: "lbl_register_now".tr,
                                            style: TextStyle(
                                                color: ColorConstant.indigoA200,
                                                fontSize: getFontSize(14),
                                                fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.w600,
                                                height: getVerticalSize(1.23)),
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () async {
                                                controller
                                                    .registrationPhoneScreen();
                                              }),
                                      ]),
                                      textAlign: TextAlign.left)))
                        ])))));
  }
}
