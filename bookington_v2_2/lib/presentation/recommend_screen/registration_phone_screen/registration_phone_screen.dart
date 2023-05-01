import 'package:bookington_v2_2/core/utils/validation_functions.dart';
import 'package:bookington_v2_2/widgets/loading_widget.dart';
import 'package:flutter/gestures.dart';

import 'controller/registration_phone_controller.dart';
import 'package:flutter/material.dart';
import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/widgets/custom_button.dart';
import 'package:bookington_v2_2/widgets/custom_text_form_field.dart';

// ignore: must_be_immutable
class RegistrationPhoneScreen extends GetWidget<RegistrationPhoneController> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  RegistrationPhoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return controller.obx((state) {
      return SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: ColorConstant.whiteA700,
            body: GestureDetector(
              onTap: () {
                FocusScope.of(context).requestFocus(FocusNode());
              },
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Container(
                    height: size.height,
                    width: size.width,
                    padding: getPadding(left: 16, right: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                           margin: getMargin(top: 40),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  width: 32,
                                  height: 32,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: ColorConstant.blue300,
                                  ),
                                  child: Center(
                                    child: Text(
                                      "1",
                                      style: AppStyle.txtManropeBold14WhiteA700,
                                    ),
                                  )),
                              Container(
                                  width: 32,
                                  height: 32,
                                  margin: getMargin(left: 20),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: ColorConstant.gray300,
                                  ),
                                  child: Center(
                                    child: Text("2",
                                        style:
                                            AppStyle.txtManropeBold14),
                                  )),
                            ],
                          ),
                        ),

                        Container(
                            width: size.width,
                            margin: getMargin(top: 20),
                            child:  Text("lbl_register".tr,
                                maxLines: null,
                                textAlign: TextAlign.center,
                                style: AppStyle.txtManropeExtraBold24.copyWith(
                                    letterSpacing: getHorizontalSize(0.72),
                                    height: getVerticalSize(1.22)))),
                        Container(
                            height: getVerticalSize(80),
                            width: getHorizontalSize(358.00),
                            margin: getMargin(top: 15),
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  CustomTextFormField(
                                    width: 310,
                                    focusNode: FocusNode(),
                                    controller: controller.txtPhoneController,
                                    hintText: "msg_enter_your_phone".tr,
                                    variant: TextFormFieldVariant.OutlineGray300,
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
                            height: getVerticalSize(80),
                            width: getHorizontalSize(358.00),
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Obx(() => CustomTextFormField(
                                      width: 310,
                                      controller:
                                          controller.txtPasswordController,
                                      hintText: "msg_enter_your_password".tr,
                                      variant:
                                          TextFormFieldVariant.OutlineGray300,
                                      padding: TextFormFieldPadding.PaddingT14L20,
                                      textInputAction: TextInputAction.done,
                                      textInputType:
                                          TextInputType.visiblePassword,
                                      suffix: InkWell(
                                          onTap: () {
                                            controller.isShowPassword.value =
                                                !controller.isShowPassword.value;
                                          },
                                          child: Container(
                                              margin: getMargin(right: 20),
                                              child: CustomImageView(
                                                  width: 28,
                                                  svgPath: controller
                                                          .isShowPassword.value
                                                      ? ImageConstant.imgHideEye
                                                      : ImageConstant.imgEye))),
                                      suffixConstraints: BoxConstraints(
                                          maxHeight: getVerticalSize(28.00)),
                                      validator: (value) {
                                        if (value == null ||
                                            (!isValidPassword(value,
                                                isRequired: true))) {
                                          return "msg_password_err".tr;
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
                                        return "Please enter match password";
                                      } else if (controller
                                              .txtPasswordConfirm.value !=
                                          controller
                                              .txtPasswordController.value) {
                                        return "Please enter match password";
                                      }
                                      return null;
                                    },
                                    isObscureText:
                                        !controller.isShowConfirm.value))
                              ]),
                        ),

                        //login button
                        CustomButton(
                          height: 55,
                          width: 310,
                          text: "lbl_register".tr,
                          margin: getMargin(top: 24),
                          onTap: () async {
                            if (_formKey.currentState!.validate()) {
                              controller.registrationWithPhone();
                            }
                          },
                        ),
                        Align(
                            alignment: Alignment.center,
                            child: Padding(
                                padding: getPadding(top: 43, bottom: 5),
                                child: RichText(
                                    text: TextSpan(children: [
                                      TextSpan(
                                          text: "msg_alredy_account".tr,
                                          style: AppStyle.txtManropeSemiBold14),
                                      TextSpan(
                                          text: "lbl_login".tr,
                                          style: AppStyle
                                              .txtManropeSemiBold14IndigoA200,
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () async {
                                              controller.loginScreen();
                                            }),
                                    ]),
                                    textAlign: TextAlign.left)))
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }, onLoading: const LoadingWidget());
  }
}
