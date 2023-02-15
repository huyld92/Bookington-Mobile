import 'controller/verify_phone_number_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/widgets/custom_button.dart';
import 'package:bookington_v2_2/widgets/custom_icon_button.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyPhoneNumberScreen extends GetWidget<VerifyPhoneNumberController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: ColorConstant.gray50,
            body: Container(
                width: size.width,
                padding: getPadding(left: 23, top: 8, right: 23, bottom: 8),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomIconButton(
                          height: 40,
                          width: 40,
                          margin: getMargin(left: 1),
                          variant: IconButtonVariant.OutlineGray300,
                          onTap: () {
                            onTapBtnArrowleft();
                          },
                          child: CustomImageView(
                              svgPath: ImageConstant.imgArrowleft)),
                      Padding(
                          padding: getPadding(left: 1, top: 34),
                          child: Text("msg_verify_phone_number".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtManropeExtraBold24
                                  .copyWith(height: getVerticalSize(0.95)))),
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
                                    text: "303".tr,
                                    style: TextStyle(
                                        color: ColorConstant.gray900,
                                        fontSize: getFontSize(14),
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w400,
                                        height: getVerticalSize(1.10))),
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
                          child: Obx(() => PinCodeTextField(
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
                                  borderRadius: BorderRadius.circular(
                                      getHorizontalSize(12.00)),
                                  selectedFillColor: ColorConstant.blueGray50,
                                  activeFillColor: ColorConstant.blueGray50,
                                  inactiveFillColor: ColorConstant.blueGray50,
                                  inactiveColor:
                                      ColorConstant.fromHex("#1212121D"),
                                  selectedColor:
                                      ColorConstant.fromHex("#1212121D"),
                                  activeColor:
                                      ColorConstant.fromHex("#1212121D"))))),
                      Align(
                          alignment: Alignment.center,
                          child: Padding(
                              padding: getPadding(top: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("lbl_time_out".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtManropeBold18
                                          .copyWith(
                                          letterSpacing:
                                          getHorizontalSize(0.20),
                                          height: getVerticalSize(1.10))
                                  ),
                                  SizedBox(width: 10,),
                                  Text("10:00",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtManropeBold18
                                          .copyWith(
                                          letterSpacing:
                                          getHorizontalSize(0.20),
                                          height: getVerticalSize(1.10))
                                  ),
                                ],
                              )
                          )
                      ),
                      CustomButton(
                          height: 56,
                          width: 327,
                          text: "lbl_verify".tr,
                          margin: getMargin(left: 1, top: 20, bottom: 5),
                      onTap: () {
                        print("verify button");
                        // Get.toNamed(AppRoutes.createPasswordScreen);
                        controller.verifyOTP();
                      },
                      ),
                      Align(
                          alignment: Alignment.center,
                          child: Padding(
                              padding: getPadding(top: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("lbl_resend_code".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtManropeSemiBold16Blue500
                                          .copyWith(
                                              letterSpacing:
                                                  getHorizontalSize(0.20),
                                              height: getVerticalSize(1.10))),
                                  Text("01:30".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtManropeSemiBold16Gray900
                                          .copyWith(
                                              letterSpacing:
                                                  getHorizontalSize(0.20),
                                              height: getVerticalSize(1.10)))
                                ],
                              ))),
                    ]))));
  }

  onTapBtnArrowleft() {
    Get.back();
  }
}
