import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/data/models/transaction_model.dart';
import 'package:bookington_v2_2/presentation/transaction_screen/wigets/transaction_item_widget.dart';
import 'package:bookington_v2_2/presentation/wallet_screen/controller/wallet_controller.dart';
import 'package:bookington_v2_2/widgets/app_bar/appbar_image.dart';
import 'package:bookington_v2_2/widgets/app_bar/appbar_title.dart';
import 'package:bookington_v2_2/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class WalletScreen extends GetWidget<WalletController> {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.gray50,
        appBar: CustomAppBar(
          height: getVerticalSize(80),
          leadingWidth: 64,
          leading: AppbarImage(
              height: getSize(64),
              width: getSize(64),
              svgPath: ImageConstant.imgArrowleft,
              margin: getMargin(left: 16, top: 12, bottom: 17),
              onTap: () {
                controller.getBack();
              }),
          centerTitle: true,
          title: AppbarTitle(text: "Wallet".tr),
        ),
        body: controller.obx(
          (state) => Container(
            height: getVerticalSize(825),
            width: double.maxFinite,
            padding: getPadding(left: 16, top: 23, right: 16, bottom: 23),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                        padding: getPadding(top: 114),
                        child: SizedBox(
                            width: getHorizontalSize(396),
                            child: Divider(
                                height: getVerticalSize(1),
                                thickness: getVerticalSize(1),
                                color: ColorConstant.blueGray100)))),
                Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("lbl_available_balance".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtManropeMedium16Bluegray500),
                      Padding(
                        padding: getPadding(top: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Obx(
                              () => Text("${controller.balance}đ",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtManropeSemiBold30BlueA700),
                            ),
                            CustomImageView(
                                svgPath: ImageConstant.imgPlus,
                                color: ColorConstant.blue400,
                                height: getSize(32),
                                width: getSize(32),
                                margin:
                                    getMargin(top: 10, right: 20, bottom: 5))
                          ],
                        ),
                      ),
                      Padding(
                          padding: getPadding(top: 46),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("lbl_transaction".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtManropeBold18),
                                GestureDetector(
                                  onTap: () {
                                    controller.transationScreen();
                                  },
                                  child: Padding(
                                      padding: getPadding(bottom: 4),
                                      child: Text("lbl_view_all".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle
                                              .txtManropeMedium14Blue500)),
                                )
                              ])),
                      Obx(
                        () => Expanded(
                          child: ListView.builder(
                              itemCount: controller.listTransactionObj.length,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (BuildContext context, int index) {
                                TransactionModel model =
                                    controller.listTransactionObj[index];
                                return TransactionItemWidget(model, index);
                              },),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
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
                  ),),
              ),
            ),
        ),
      ),
    );
  }
}
