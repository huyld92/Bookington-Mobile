import 'package:bookington_v2_2/presentation/messages_screen.dart/widgets/messages_item_widget.dart';
import 'package:bookington_v2_2/widgets/custom_bottom_bar.dart';

import 'controller/messages_controller.dart';
import 'models/messages_item_model.dart';
 import 'package:flutter/material.dart';
import 'package:bookington_v2_2/core/app_export.dart';

// ignore_for_file: must_be_immutable
class MessagesScreen extends GetWidget<MessagesController> {
  @override
  Widget build(BuildContext context) {
    CustomBottomBar.selectedIndex = 1.obs;

    return SafeArea(
      child:  GestureDetector(
        onTap: () {
          print('focus');
        FocusScope.of(context).requestFocus(FocusNode());
        },
        child:Scaffold(
        resizeToAvoidBottomInset: false ,
        body: Container(
          width: double.maxFinite,
          padding: getPadding(left: 19, top: 40, right: 19, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
            Container(
              width: getVerticalSize(360),
              margin: getMargin(
                  left: 10, right: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadiusStyle.circleBorder23,
                border: BorderRadiusStyle.borderGray2
              ),
              child: TextField(
                controller: controller
                    .searchController,
                focusNode: FocusNode(),
                decoration: InputDecoration(
                  hintText: 'lbl_search_for_court'.tr,
                  prefixIcon: const Icon(Icons.search),
                  fillColor: ColorConstant
                      .whiteA700,
                  contentPadding: getPadding(
                      all: 16),
                  border: InputBorder.none,
                ),
                textInputAction: TextInputAction
                    .search,
                onSubmitted: (value) {
                  print('Search  messages');
                  // controller.searchByName(1);
                },
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Padding(
                  padding: getPadding(top: 10),
                  child: Text("lbl_messages".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtManropeSemiBold20)),
              CustomImageView(
                  svgPath: ImageConstant.imgSquareEdit,
                  height: getSize(24),
                  width: getSize(24),
                  margin: getMargin(bottom: 2))
            ]),
            Padding(
                padding: getPadding(top: 24),
                child: Obx(() => ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    separatorBuilder: (context, index) {
                      return SizedBox(height: getVerticalSize(24));
                    },
                    itemCount: controller
                        .messagesModelObj.value.messagesItemList.length,
                    itemBuilder: (context, index) {
                      MessagesItemModel model = controller
                          .messagesModelObj.value.messagesItemList[index];
                      return MessagesItemWidget(model);
                    })))
          ]),
        ),
        bottomNavigationBar: CustomBottomBar(
          onChanged: (BottomBarEnum type) {
            Get.toNamed(getCurrentRoute(type));
          },
        ),
      ),)
    );
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return AppRoutes.homeScreen;
      case BottomBarEnum.Message:
        return AppRoutes.messageChatScreen;
      case BottomBarEnum.Search:
        return AppRoutes.searchScreen;
      case BottomBarEnum.History:
        return AppRoutes.historyScreen;
      case BottomBarEnum.Profile:
        return AppRoutes.profileScreen;
      default:
        return "/";
    }
  }
}
