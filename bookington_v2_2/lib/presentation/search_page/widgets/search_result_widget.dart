import 'package:bookington_v2_2/presentation/search_page/models/search_model.dart';
import 'package:bookington_v2_2/presentation/search_page/widgets/search_empty_widget.dart';

import '../controller/search_controller.dart';
import 'package:flutter/material.dart';
import 'package:bookington_v2_2/core/app_export.dart';

import 'listrectangle_item_widget.dart';

// ignore: must_be_immutable
class SearchResultWidget extends StatelessWidget {
  SearchResultWidget(this.controller, {super.key});

  SearchController controller;

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) => SizedBox(
        width: size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: getPadding(
                top: 20,
                right: 0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: getPadding(
                      left: 10,
                      bottom: 5,
                    ),
                    child: Text(
                      "${"lbl_result".tr}(${controller.totalCourt.value})",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtManropeBold18,
                    ),
                  ),
                  CustomImageView(
                    margin: getMargin(right: 10, bottom: 5),
                    svgPath: ImageConstant.imgFilter,
                    height: getSize(
                      28.00
                    ),
                    width: getSize(
                      28.00
                    ),
                    onTap: () {
                      controller.filterDialog();
                    },
                  ),
                ],
              ),
            ),
            Container(
              margin: getMargin(bottom: 20),
              height: getVerticalSize(430),
              child: Obx(() => ListView.builder(
                  controller: controller.scroll,
                  shrinkWrap: true,
                  itemCount: controller.listSearchMode.length,
                  itemBuilder: (context, index) {
                    SearchModel model = controller.listSearchMode[index];
                    return ListRectangleItemWidget(model, index);
                  },
                ),
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
                  child: Text("loading.... ",
                      style: AppStyle.txtManropeSemiBold16),
                ),
              ],
            ),
          ),
        ),
      ),
      onEmpty: SearchEmptyWidget(),
    );
  }
}
