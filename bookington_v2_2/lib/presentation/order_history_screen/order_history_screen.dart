import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/presentation/order_history_screen/controller/order_history_controller.dart';
import 'package:bookington_v2_2/presentation/order_history_screen/models/order_history_model.dart';
import 'package:bookington_v2_2/presentation/order_history_screen/widgets/order_history_empty_widgets.dart';
import 'package:bookington_v2_2/presentation/order_history_screen/widgets/order_history_item_widgets.dart';
import 'package:bookington_v2_2/widgets/app_bar/appbar_image.dart';
import 'package:bookington_v2_2/widgets/app_bar/appbar_title.dart';
import 'package:bookington_v2_2/widgets/app_bar/custom_app_bar.dart';
import 'package:bookington_v2_2/widgets/loading_widget.dart';
import 'package:flutter/material.dart';

class OrderHistoryScreen extends GetWidget<OrderHistoryController> {
  const OrderHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return controller.obx((state) {
      return SafeArea(
        child: Scaffold(
          backgroundColor: ColorConstant.whiteA700,
          appBar: CustomAppBar(
            height: getVerticalSize(80.00),
            leadingWidth: 64,
            leading: AppbarImage(
                height: getSize(64.00),
                width: getSize(64.00),
                svgPath: ImageConstant.imgArrowLeft,
                margin: getMargin(left: 24, top: 10, bottom: 10),
                onTap: () {
                  controller.getBack();
                }),
            title: AppbarTitle(
                text: "lbl_order_history".tr, margin: getMargin(left: 16)),
          ),
          body: Container(
            padding: getPadding(all: 10),
            child: controller.listOrderHistory.isNotEmpty
                ? Obx(
                    () => ListView.builder(
                      controller: controller.scroll,
                      shrinkWrap: true,
                      itemCount: controller.listOrderHistory.length,
                      itemBuilder: (context, index) {
                        OrderHistoryModel model =
                            controller.listOrderHistory[index];
                        return OrderHistoryItemWidgets(model, index);
                      },
                    ),
                  )
                : const OrderHistoryEmptyWidgets(),
          ),
        ),
      );
    }, onLoading: const LoadingWidget());
  }
}
