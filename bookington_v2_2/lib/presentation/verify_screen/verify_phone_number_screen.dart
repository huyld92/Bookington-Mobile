import 'package:bookington_v2_2/widgets/app_bar/appbar_image.dart';
import 'package:bookington_v2_2/widgets/app_bar/custom_app_bar.dart';
import 'package:bookington_v2_2/widgets/loading_widget.dart';

import 'controller/verify_phone_number_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/widgets/custom_button.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyPhoneNumberScreen extends GetWidget<VerifyPhoneNumberController> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  VerifyPhoneNumberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return controller.obx((state) {
      return SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Scaffold(
            appBar: CustomAppBar(
              height: getVerticalSize(80.00),
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
            ),
            resizeToAvoidBottomInset: false,
            backgroundColor: ColorConstant.gray50,
            body: Form(
              key: _formKey,
              child: Container(
                width: size.width,
                padding: getPadding(left: 23, top: 8, right: 23, bottom: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        margin: getMargin(bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                width: 32,
                                height: 32,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: ColorConstant.gray300,
                                ),
                                child: Center(
                                  child: Text(
                                    "1",
                                    style: AppStyle.txtManropeBold14,
                                  ),
                                )),
                            Container(
                                width: 32,
                                height: 32,
                                margin: getMargin(left: 20),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: ColorConstant.blue300,
                                ),
                                child: Center(
                                  child: Text("2",
                                      style:
                                          AppStyle.txtManropeBold14WhiteA700),
                                )),
                            Obx(
                              () => controller.isResetPassword.value
                                  ? Container(
                                      width: 32,
                                      height: 32,
                                      margin: getMargin(left: 20),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: ColorConstant.gray300,
                                      ),
                                      child: Center(
                                        child: Text("3",
                                            style: AppStyle.txtManropeBold14),
                                      ),
                                    )
                                  : const SizedBox(),
                            ),
                          ],
                        )),

                    Padding(
                      padding: getPadding(left: 1, top: 34),
                      child: Text(
                        "msg_verification".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtManropeExtraBold24.copyWith(
                          height: getVerticalSize(0.95),
                        ),
                      ),
                    ),
                    Container(
                        width: getHorizontalSize(305.00),
                        margin: getMargin(left: 1, top: 7),
                        child: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text: "msg_we_send_a_code".tr,
                                  style: TextStyle(
                                      color: ColorConstant.blueGray500,
                                      fontSize: getFontSize(14),
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.w600,
                                      height: getVerticalSize(1.10))),
                              TextSpan(
                                text: controller.phoneNumber,
                                style: AppStyle.txtManropeRegular14,
                              ),
                              TextSpan(
                                  text: "msg_enter_it_here".tr,
                                  style: TextStyle(
                                      color: ColorConstant.blueGray500,
                                      fontSize: getFontSize(14),
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.w600,
                                      height: getVerticalSize(1.10)))
                            ]),
                            textAlign: TextAlign.left)),
                    Padding(
                      padding: getPadding(left: 1, top: 37),
                      child: Obx(
                        () => PinCodeTextField(
                          appContext: context,
                          controller: controller.otpController.value,
                          length: 6,
                          obscureText: false,
                          obscuringCharacter: '*',
                          keyboardType: TextInputType.number,
                          autoDismissKeyboard: true,
                          enableActiveFill: true,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          onChanged: (value) {},
                          textStyle: TextStyle(
                              color: ColorConstant.gray900,
                              fontSize: getFontSize(24),
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w800,
                              height: getVerticalSize(0.95)),
                          pinTheme: PinTheme(
                            fieldHeight: getHorizontalSize(50.00),
                            fieldWidth: getHorizontalSize(50.00),
                            shape: PinCodeFieldShape.box,
                            borderRadius:
                                BorderRadius.circular(getHorizontalSize(12.00)),
                            selectedFillColor: ColorConstant.blueGray50,
                            activeFillColor: ColorConstant.blueGray50,
                            inactiveFillColor: ColorConstant.blueGray50,
                            inactiveColor: ColorConstant.fromHex("#1212121D"),
                            selectedColor: ColorConstant.fromHex("#1212121D"),
                            activeColor: ColorConstant.fromHex("#1212121D"),
                          ),
                        ),
                      ),
                    ),
                    // Align(
                    //     alignment: Alignment.center,
                    //     child: Padding(
                    //         padding: getPadding(top: 10),
                    //         child: Row(
                    //           mainAxisAlignment: MainAxisAlignment.center,
                    //           children: [
                    //             Text("lbl_time_out".tr,
                    //                 overflow: TextOverflow.ellipsis,
                    //                 textAlign: TextAlign.left,
                    //                 style: AppStyle.txtManropeBold18.copyWith(
                    //                     letterSpacing: getHorizontalSize(0.20),
                    //                     height: getVerticalSize(1.10))),
                    //             const SizedBox(
                    //               width: 10,
                    //             ),
                    //             Text("05:00",
                    //                 overflow: TextOverflow.ellipsis,
                    //                 textAlign: TextAlign.left,
                    //                 style: AppStyle.txtManropeBold18.copyWith(
                    //                     letterSpacing: getHorizontalSize(0.20),
                    //                     height: getVerticalSize(1.10))),
                    //           ],
                    //         ))),
                    CustomButton(
                      height: 56,
                      width: 327,
                      text: "lbl_verify".tr,
                      margin: getMargin(left: 1, top: 20, bottom: 5),
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          if (controller.isResetPassword.value) {
                            controller.forgotPasswordVerifyOTP();
                          } else {
                            controller.verifyOTP();
                          }
                        }
                      },
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: getPadding(left: 5, top: 15, right: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Obx(
                              () => InkWell(
                                onTap: () {
                                  if (!controller.isResend.value) {
                                    controller.resendOtp();
                                  }
                                },
                                child: Text(
                                  "lbl_resend_code".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: controller.isResend.value
                                      ? AppStyle.txtManropeSemiBold16Gray500
                                          .copyWith(
                                              letterSpacing:
                                                  getHorizontalSize(0.20),
                                              height: getVerticalSize(1.10))
                                      : AppStyle.txtManropeSemiBold16Blue500
                                          .copyWith(
                                          letterSpacing:
                                              getHorizontalSize(0.20),
                                          height: getVerticalSize(1.10),
                                        ),
                                ),
                              ),
                            ),
                            Obx(
                              () => Text(
                                controller.time.value,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtManropeSemiBold16Blue500
                                    .copyWith(
                                  letterSpacing: getHorizontalSize(0.20),
                                  height: getVerticalSize(1.10),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }, onLoading: const LoadingWidget());
  }
}
