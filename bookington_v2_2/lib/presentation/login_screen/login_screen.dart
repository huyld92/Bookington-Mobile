import 'package:flutter/gestures.dart';

import 'controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/core/utils/validation_functions.dart';
import 'package:bookington_v2_2/widgets/custom_button.dart';
import 'package:bookington_v2_2/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class LoginScreen extends GetWidget<LoginController> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: ColorConstant.whiteA700,
          body: Form(
              key: _formKey,
              child: Container(
                  width: size.width,
                  padding: getPadding(top: 150, left: 16, right: 16),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                            width: getHorizontalSize(261.00),
                            margin: getMargin(left: 8, bottom: 10),
                            child: Text("msg_welcome_back_glad".tr,
                                maxLines: null,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtManropeExtraBold24.copyWith(
                                    letterSpacing: getHorizontalSize(0.72),
                                    height: getVerticalSize(1.22)))),
                        SizedBox(
                            height: 80,
                            width: getHorizontalSize(358.00),
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
                                    variant:
                                        TextFormFieldVariant.OutlineGray300,
                                    padding: TextFormFieldPadding.PaddingT14L20,
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

                        SizedBox(
                          height: 80,
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
                                      child: CustomImageView(
                                          margin: getMargin(right: 20),
                                          width: 28,
                                          svgPath:
                                              controller.isShowPassword.value
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
                                  isObscureText:
                                      !controller.isShowPassword.value))
                            ],
                          ),
                        ),
                        //login button
                        CustomButton(
                          height: 55,
                          width: 310,
                          text: "lbl_login".tr,
                          margin: getMargin(top: 20),
                          onTap: () async {
                            if (_formKey.currentState!.validate()) {
                              controller.login(
                                  controller.txtPhoneController.text,
                                  controller.txtPasswordController.text);
                            }
                          },
                        ),
                        Align(
                            alignment: Alignment.topRight,
                            child: Padding(
                                padding:
                                    getPadding(top: 15, right: 30, bottom: 5),
                                child: GestureDetector(
                                  child: Text('lbl_forgot_password'.tr),
                                  onTap: () {
                                    print('Forgot password');
                                  },
                                ))),

                        Align(
                            alignment: Alignment.center,
                            child: Padding(
                                padding: getPadding(top: 20, bottom: 5),
                                child: RichText(
                                    text: TextSpan(children: [
                                      TextSpan(
                                          text: "msg_don_t_have_an_account2".tr,
                                          style: AppStyle.txtManropeSemiBold14),
                                      TextSpan(
                                          text: "lbl_register_now".tr,
                                          style: AppStyle
                                              .txtManropeSemiBold14IndigoA200,
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () async {
                                              controller
                                                  .registrationPhoneScreen();
                                            }),
                                    ]),
                                    textAlign: TextAlign.left)))
                      ]))),
        ),
      ),
    );
  }
}
