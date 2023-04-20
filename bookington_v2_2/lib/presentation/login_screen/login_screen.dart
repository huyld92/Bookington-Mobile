import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/presentation/login_screen/controller/login_controller.dart';
import 'package:bookington_v2_2/widgets/custom_button.dart';
import 'package:bookington_v2_2/widgets/custom_text_form_field.dart';
import 'package:flutter/gestures.dart';

import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class LoginScreen extends GetWidget<LoginController> {
  LoginScreen({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          extendBody: true,
          extendBodyBehindAppBar: true,
          backgroundColor: Colors.white,
          body: controller.obx(
            (state) => SingleChildScrollView(
              child: Container(
                width: size.width,
                height: size.height - 22,
                decoration: BoxDecoration(
                  // gradient: LinearGradient(
                  //   begin: const Alignment(-0.2, 0.46),
                  //   end: const Alignment(0.72, 0.86),
                  //   colors: [ColorConstant.blue500, ColorConstant.blue400],
                  // ),
                  image: DecorationImage(
                    image: AssetImage(
                      ImageConstant.imgBadminton,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: getSize(320),
                            child: Center(
                                child: Text(
                              "Bookington",
                              style: AppStyle.txtManropeExtraBold24WhiteA700,
                            )),
                          ),
                          Container(
                            height: getSize(450),
                            padding: getPadding(
                                left: 20, top: 31, right: 20, bottom: 31),
                            decoration: AppDecoration.fillWhiteA700.copyWith(
                                borderRadius:
                                    BorderRadiusStyle.customBorderTLR10),
                            child: Form(
                              key: _formKey,
                              child: Container(
                                width: size.width,
                                padding: getPadding(left: 16, right: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Center(
                                      child: Text("Login",
                                          style: AppStyle.txtManropeBold24),
                                    ),
                                    SizedBox(
                                        height: getSize(80),
                                        width: getHorizontalSize(358.00),
                                        // BorderRadiusStyle.roundedBorder8),
                                        child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              CustomTextFormField(
                                                width: 310,
                                                focusNode: FocusNode(),
                                                controller: controller
                                                    .txtPhoneController,
                                                hintText:
                                                    "msg_enter_your_phone".tr,
                                                variant: TextFormFieldVariant
                                                    .OutlineGray300,
                                                padding: TextFormFieldPadding
                                                    .PaddingT14L20,
                                                textInputAction:
                                                    TextInputAction.none,
                                                textInputType:
                                                    TextInputType.phone,
                                                suffixConstraints:
                                                    BoxConstraints(
                                                        maxHeight:
                                                            getVerticalSize(
                                                                32.00)),
                                                validator: (value) {
                                                  if (value == null
                                                      // ||  (!isValidPhone(value,
                                                      //     isRequired: true))
                                                  ) {
                                                    return "Please enter valid phone";
                                                  }
                                                  return null;
                                                },
                                              )
                                            ])),
                                    SizedBox(
                                      height: getSize(80),
                                      width: getHorizontalSize(358.00),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Obx(() => CustomTextFormField(
                                              width: 310,
                                              controller: controller
                                                  .txtPasswordController,
                                              hintText:
                                                  "msg_enter_your_password".tr,
                                              variant: TextFormFieldVariant
                                                  .OutlineGray300,
                                              padding: TextFormFieldPadding
                                                  .PaddingT14L20,
                                              textInputAction:
                                                  TextInputAction.done,
                                              textInputType:
                                                  TextInputType.visiblePassword,
                                              suffix: InkWell(
                                                  onTap: () {
                                                    controller.isShowPassword
                                                            .value =
                                                        !controller
                                                            .isShowPassword
                                                            .value;
                                                  },
                                                  child: CustomImageView(
                                                      margin:
                                                          getMargin(right: 20),
                                                      width: 28,
                                                      svgPath: controller
                                                              .isShowPassword
                                                              .value
                                                          ? ImageConstant
                                                              .imgHideEye
                                                          : ImageConstant
                                                              .imgEye)),
                                              suffixConstraints: BoxConstraints(
                                                  maxHeight:
                                                      getVerticalSize(28.00)),
                                              validator: (value) {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  return "Please enter valid password";
                                                }
                                                return null;
                                              },
                                              isObscureText: !controller
                                                  .isShowPassword.value))
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
                                              controller
                                                  .txtPhoneController.text,
                                              controller
                                                  .txtPasswordController.text);
                                        }
                                      },
                                    ),
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: Padding(
                                        padding: getPadding(
                                            top: 15, right: 30, bottom: 5),
                                        child: GestureDetector(
                                          child: Text('lbl_forgot_password'.tr),
                                          onTap: () {
                                            controller.forgotPassword();
                                          },
                                        ),
                                      ),
                                    ),

                                    Align(
                                      alignment: Alignment.center,
                                      child: Padding(
                                        padding: getPadding(top: 20, bottom: 5),
                                        child: RichText(
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                    text:
                                                        "msg_don_t_have_an_account2"
                                                            .tr,
                                                    style: AppStyle
                                                        .txtManropeSemiBold14),
                                                TextSpan(
                                                  text: "lbl_register_now".tr,
                                                  style: AppStyle
                                                      .txtManropeSemiBold14IndigoA200,
                                                  recognizer:
                                                      TapGestureRecognizer()
                                                        ..onTap = () async {
                                                          controller
                                                              .registrationPhoneScreen();
                                                        },
                                                ),
                                              ],
                                            ),
                                            textAlign: TextAlign.left),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ])
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
