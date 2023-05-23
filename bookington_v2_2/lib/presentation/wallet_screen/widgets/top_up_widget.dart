import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/presentation/wallet_screen/controller/wallet_controller.dart';
import 'package:bookington_v2_2/widgets/app_bar/appbar_image.dart';
import 'package:bookington_v2_2/widgets/app_bar/appbar_title.dart';
import 'package:bookington_v2_2/widgets/app_bar/custom_app_bar.dart';
import 'package:bookington_v2_2/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../../../core/utils/currency_formatter.dart';

class TopUpWidget extends StatelessWidget {
  WalletController controller = Get.find();

  TopUpWidget({super.key});

  final NumberFormat _currencyFormatter =
      NumberFormat.currency(locale: 'vi_VN', symbol: '');

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: getVerticalSize(360),
        padding: getPadding(bottom: 30),
        decoration: BoxDecoration(color: ColorConstant.whiteA700),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomAppBar(
              height: getVerticalSize(80),
              leadingWidth: getSize(64),
              leading: AppbarImage(
                  height: getSize(32),
                  width: getSize(32),
                  svgPath: ImageConstant.imgArrowLeft,
                  margin: getMargin(left: 16, top: 12, bottom: 17),
                  onTap: () {
                    controller.getBack();
                  }),
              title: Text("lbl_enter_top_up_amount".tr,
                  style: AppStyle.txtManropeBold16),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    TextField(
                      controller: controller.amountController,
                      textAlign: TextAlign.center,
                      // textDirection: TextDirection.LTR,
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      autofocus: true,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        // CurrencyFormatter(_currencyFormatter),
                        LengthLimitingTextInputFormatter(10),
                      ],
                      maxLengthEnforcement:
                          MaxLengthEnforcement.truncateAfterCompositionEnds,
                      decoration: InputDecoration(
                          hintText: '0',
                          border: InputBorder.none,
                          hintStyle: AppStyle.txtManropeSemiBold20),
                      style: AppStyle.txtManropeBold20,
                      onChanged: (text) {
                         double amount = double.tryParse(text) ?? 0.0;
                        controller.amount.value = amount;
                        if (text.isEmpty) {
                          controller.isTextFieldEmpty.value = true;
                        } else {
                          if (amount < 10000) {
                            controller.isTextFieldEmpty.value = true;
                          } else {
                            controller.isTextFieldEmpty.value = false;
                          }
                        }
                      },
                    ),
                    // Padding(
                    //   padding: EdgeInsets.only(right: 10.0),
                    //   child: Text(
                    //     _currencyFormatter.currencySymbol,
                    //     style: TextStyle(fontSize: 16.0),
                    //   ),
                    // ),
                  ],
                ),
                if (controller.amount.value > 0 &&
                    controller.amount.value < 10000)
                  Obx(
                    () => Text("Minimum amount: 10.000đ",
                        style: controller.amount.value == 0
                            ? AppStyle.txtManropeSemiBold16Gray500
                            : AppStyle.txtManropeSemiBold16Gray500),
                  )
                else
                  Obx(
                    () => Text("Current balance: ${controller.balance.value}",
                        style: controller.amount.value == 0
                            ? AppStyle.txtManropeSemiBold16Gray500
                            : AppStyle.txtManropeSemiBold16Gray500),
                  ),
                Obx(
                  () => CustomButton(
                    height: getVerticalSize(56),
                    width: getHorizontalSize(327),
                    text: "lbl_next".tr,
                    margin: getMargin(top: 20, bottom: 5),
                    variant: controller.amount.value < 10000
                        ? ButtonVariant.FillGray300
                        : ButtonVariant.FillBlue400,
                    onTap: () {
                      if (controller.amount.value >= 10000) {
                        Get.back();
                        controller.topUpAmount();
                      }
                      // controller.testDeeplink();
                    },
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
