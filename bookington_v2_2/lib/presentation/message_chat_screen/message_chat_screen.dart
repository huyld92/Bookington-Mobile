// ignore_for_file: unused_local_variable

import 'package:bookington_v2_2/widgets/app_bar/appbar_image.dart';

import 'controller/message_chat_controller.dart';
import 'package:flutter/material.dart';
import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/widgets/app_bar/custom_app_bar.dart';
import 'package:bookington_v2_2/widgets/custom_button.dart';
import 'package:bookington_v2_2/widgets/custom_icon_button.dart';

class MessageChatScreen extends GetWidget<MessageChatController> {
  const MessageChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Scaffold(
          backgroundColor: ColorConstant.whiteA700,
          appBar: CustomAppBar(
            height: getVerticalSize(90.00),
            leadingWidth: 64,
            leading: AppbarImage(
              height: getSize(32.00),
              width: getSize(32.00),
              svgPath: ImageConstant.imgArrowLeft,
              margin: getMargin(left: 10),
              onTap: () {
                controller.getBack();
              },
            ),
            centerTitle: true,
            title:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Row(children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Phu Tho Court Ow".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtManropeBold18.copyWith(
                          letterSpacing: getHorizontalSize(0.10),
                        ),
                      ),
                    ),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                            padding: getPadding(top: 2, right: 56),
                            child: Text("lbl_online".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtManropeMedium12Green500
                                    .copyWith(
                                        letterSpacing:
                                            getHorizontalSize(0.40)))))
                  ],
                ),
              ])
            ]),
          ),
          resizeToAvoidBottomInset: true,
          body: Column(
            children: [
              Expanded(
                child: Obx(() {
                  return ListView.builder(
                    reverse: true,
                    itemCount: controller.messages.length,
                    itemBuilder: (context, index) {
                      final message = controller.messages[index];
                      return Align(
                        alignment: message.isMe
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Container(
                          padding: getPadding(left: 12, top: 9, right: 12, bottom: 8),
                          margin: getMargin(left: 16, top: 9, right: 16, bottom: 8),
                          decoration: BoxDecoration(
                            color: message.isMe
                                ? ColorConstant.blue300
                                : ColorConstant.gray300,
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Text(
                            message.text,
                            style: AppStyle.txtManropeRegular16
                          ),
                        ),
                      );
                    },
                  );
                }),
              ),
              Container(
                padding: getPadding(all: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    top: BorderSide(color: ColorConstant.gray300),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: const InputDecoration.collapsed(
                          hintText: 'Type a message...',
                        ),
                        maxLines: null,
                        // Allow multiple lines
                        textInputAction: TextInputAction.newline,
                        // Create new line on Enter
                        onSubmitted: (text) {
                          if (text.trim().isNotEmpty) {
                            controller.sendMessage(text);
                          }
                        },
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.send),
                      onPressed: () {
                        final text = controller.messagesController.text;
                        if (text.trim().isNotEmpty) {
                          controller.sendMessage(text);
                          controller.messagesController.clear();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          // bottomNavigationBar: Container(
          //   width: size.width,
          //   decoration: AppDecoration.outlineBluegray1000f,
          //   child: Column(
          //     mainAxisSize: MainAxisSize.min,
          //     mainAxisAlignment: MainAxisAlignment.start,
          //     children: [
          //       Container(
          //           width: size.width,
          //           padding:
          //               getPadding(left: 24, top: 16, right: 24, bottom: 16),
          //           decoration: AppDecoration.outlineBluegray1000f,
          //           child: Row(
          //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //               children: [
          //                 Container(
          //                     width: 290,
          //                     height: 56,
          //                     padding: getPadding(
          //                         left: 16, top: 5, right: 16, bottom: 5),
          //                     decoration: AppDecoration.fillBluegray50.copyWith(
          //                         borderRadius:
          //                             BorderRadiusStyle.roundedBorder20),
          //                     child: Row(
          //                         mainAxisAlignment: MainAxisAlignment.center,
          //                         children: [
          //                           SizedBox(
          //                             width: 210,
          //                             child: Padding(
          //                               padding: EdgeInsets.only(
          //                                   bottom: MediaQuery.of(context)
          //                                       .viewInsets
          //                                       .bottom),
          //                               child: TextField(
          //                                 controller: controller.messagesController,
          //                                 focusNode: FocusNode(),
          //                                 decoration: InputDecoration(
          //                                   hintText: 'Aa'.tr,
          //                                   contentPadding: getPadding(all: 5),
          //                                   border: InputBorder.none,
          //                                 ),
          //                                 textInputAction: TextInputAction.send,
          //
          //                               ),
          //                             ),
          //                           ),
          //                           CustomImageView(
          //                               svgPath: ImageConstant.imgCamera,
          //                               height: getSize(24.00),
          //                               width: getSize(24.00),
          //                               margin: getMargin(left: 10),
          //                               onTap: () {
          //                                 onTapImgCamera();
          //                               })
          //                         ])),
          //                 CustomIconButton(
          //                     height: 56,
          //                     width: 56,
          //                     variant: IconButtonVariant.FillBlue400,
          //                     padding: IconButtonPadding.PaddingAll16,
          //                     child: CustomImageView(
          //                         svgPath: ImageConstant.imgSend))
          //               ]))
          //     ],
          //   ),
          // ),
        ),
      ),
    );
  }

  onTapImgCamera() async {
    await PermissionManager.askForPermission(Permission.camera);
    await PermissionManager.askForPermission(Permission.storage);
    List<String?>? imageList = [];
    // await FileManager().showModelSheetForImage(getImages: (value) async {
    //   imageList = value;
    // });
  }
}
