import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/data/models/transaction_model.dart';
import 'package:bookington_v2_2/presentation/transaction_screen/controller/transaction_controller.dart';
import 'package:bookington_v2_2/presentation/transaction_screen/wigets/transaction_item_widget.dart';
import 'package:bookington_v2_2/widgets/app_bar/appbar_image.dart';
import 'package:bookington_v2_2/widgets/app_bar/appbar_title.dart';
import 'package:bookington_v2_2/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

class TransactionScreen extends GetWidget<TransactionController> {
  const TransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar(
            height: getVerticalSize(80.00),
            leadingWidth: 64,
            leading: AppbarImage(
              height: getSize(64.00),
              width: getSize(64.00),
              svgPath: ImageConstant.imgArrowLeft,
              margin: getMargin(left: 24),
              onTap: () {
                controller.getBack();
              },
            ),
            centerTitle: true,
            title: AppbarTitle(text: "lbl_transaction".tr),
        actions: [
          CustomImageView(
            margin: getMargin(right: 20),
            height: 32,
            svgPath: ImageConstant.imgFilter,
          )
        ],
        ),
        body: Container(
          height: double.infinity,
          decoration: BoxDecoration(color: ColorConstant.whiteA700),
          padding: getPadding(top: 10.0 ),
          child: Column(
            children: [
              Obx(() => Expanded(
                  child:  ListView.builder(
                      itemCount: controller.listTransactionObj.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (BuildContext context, int index) {
                        TransactionModel model = controller.listTransactionObj[index];
                        return  TransactionItemWidget(model,index);
                      }),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
