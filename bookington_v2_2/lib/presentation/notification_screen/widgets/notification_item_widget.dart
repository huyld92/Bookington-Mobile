import 'package:bookington_v2_2/data/models/notification_model.dart';
import 'package:intl/intl.dart';

import '../controller/notification_controller.dart';
import 'package:flutter/material.dart';
import 'package:bookington_v2_2/core/app_export.dart';

class NotificationItemWidget extends StatelessWidget {
  NotificationItemWidget(this.notificationModel, this.index, {super.key});

  NotificationModel notificationModel;
  int index;
  var controller = Get.find<NotificationController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: getVerticalSize(82),
      width: size.width,
      margin: getMargin(left: 10, right: 10, bottom: 10),
      padding: getPadding(left: 5, top: 12, right: 5, bottom: 12),
      decoration: AppDecoration.fillBlue50,
      child: InkWell(
        onTap: () {
          controller.markAsReadNotification(index);
        },
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: getPadding(),
                child: Text(
                  // notificationModel.createAt,
                  DateFormat("dd-MM-yyyy").format(notificationModel.createAt),
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtManropeSemiBold12.copyWith(
                    letterSpacing: getHorizontalSize(0.3),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Stack(children: [
                    CustomImageView(
                      svgPath: ImageConstant.imgNotify,
                      height: getSize(48),
                      width: getSize(48),
                      radius: BorderRadius.circular(
                        getHorizontalSize(24),
                      ),
                      margin: getMargin(bottom: 1),
                    ),
                    notificationModel.isRead
                        ? const SizedBox()
                        : Positioned(
                            top: 0,
                            right: 30,
                            child: Container(
                              height: getVerticalSize(16),
                              width: getHorizontalSize(16),
                              decoration: BoxDecoration(
                                color: ColorConstant.red500,
                                shape: BoxShape.circle,
                                border:
                                    Border.all(width: 1.5, color: Colors.white),
                              ),
                            ),
                          )
                  ]),
                  Container(
                    width: getHorizontalSize(200),
                    margin: getMargin(
                      left: 14,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          notificationModel.content,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          maxLines: 6,
                          style: AppStyle.txtManropeMedium14.copyWith(
                            letterSpacing: getHorizontalSize(0.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
