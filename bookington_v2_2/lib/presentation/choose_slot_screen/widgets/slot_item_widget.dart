import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/core/utils/size_utils.dart';
import 'package:bookington_v2_2/data/models/slot_model.dart';
import 'package:bookington_v2_2/presentation/choose_slot_screen/controller/choose_slot_controller.dart';
import 'package:bookington_v2_2/widgets/custom_button.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../theme/app_decoration.dart';
import '../../../theme/app_style.dart';

// ignore: must_be_immutable
class SlotItemWidget extends StatelessWidget {
  SlotItemWidget(this.index);

  int index;

  var controller = Get.find<ChooseSlotController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: getPadding(all: 5),
      child:Obx(() =>  OutlinedButton(
        onPressed: () {
          if(controller.slotList[index].isActive){
            print("choose slot");
            controller.selectSlot(index);
          }
        },
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusStyle.roundedBorder16),
          side: BorderSide(width: 2),
          backgroundColor: controller.slotList[index].isActive
              ? (controller.listSelected[index]? ColorConstant.blue500 :ColorConstant.whiteA700)
              :ColorConstant.gray500
        ),
        child: RichText(
          text: TextSpan(
            text: DateFormat("HH:mm")
                .format(controller.slotList[index].startTime),
            style: AppStyle.txtManropeBold18,
            children: [
              TextSpan(
                text: "\nto " +
                    DateFormat("HH:mm")
                        .format(controller.slotList[index].endTime),
                style: AppStyle.txtManropeRegular12,
              ),
              TextSpan(
                text:
                    "\n" + controller.slotList[index].price.toString() + " VND",
                style: AppStyle.txtManropeSemiBold14Orange500,
              )
            ],
          ),
        ),
      ),),
    );

    //   Container(
    //   padding: getPadding(
    //     all: 5
    //   ),
    //   decoration: AppDecoration.outlineGray200.copyWith(
    //     borderRadius: BorderRadiusStyle.roundedBorder5,
    //   ),
    //   child: Column(
    //     mainAxisSize: MainAxisSize.min,
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: [
    //       Text(
    //         DateFormat("HH:mm").format(controller.slotList[index].startTime),
    //         overflow: TextOverflow.ellipsis,
    //         textAlign: TextAlign.left,
    //         style: AppStyle.txtManropeBold18,
    //       ),
    //       Padding(
    //         padding: getPadding(
    //           left: 5,
    //           bottom: 4,
    //         ),
    //         child: Text(
    //           "to " + DateFormat("HH:mm").format(controller.slotList[index].endTime),
    //           overflow: TextOverflow.ellipsis,
    //           textAlign: TextAlign.left,
    //           style: AppStyle.txtManropeRegular12,
    //         ),
    //       ),
    //       Padding(
    //         padding: getPadding(
    //           left:0,
    //           bottom: 4,
    //         ),
    //         child: Text(
    //           controller.slotList[index].price.toString() + " VND",
    //           overflow: TextOverflow.ellipsis,
    //           textAlign: TextAlign.left,
    //           style: AppStyle.txtManropeSemiBold14Blue500,
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
