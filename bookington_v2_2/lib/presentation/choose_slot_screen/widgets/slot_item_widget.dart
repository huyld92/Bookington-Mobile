import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/presentation/choose_slot_screen/controller/choose_slot_controller.dart';

import 'package:flutter/material.dart';
 import 'package:intl/intl.dart';


// ignore: must_be_immutable
class SlotItemWidget extends StatelessWidget {
  SlotItemWidget(this.index, {super.key});

  int index;

  var controller = Get.find<ChooseSlotController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
    padding: getPadding(all: 5),
    child: Obx(
    () => OutlinedButton(
    onPressed: () {
    if (controller.slotList[index].isActive) {
    controller.selectSlot(index);
    }
    },
    style: OutlinedButton.styleFrom(
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadiusStyle.roundedBorder16),
    side: const BorderSide(width: 2),
    backgroundColor: controller.slotList[index].isActive
    ? (controller.listSelected[index]
    ? ColorConstant.blue400
        : ColorConstant.whiteA700)
        : ColorConstant.gray500),
    child: RichText(
    text: TextSpan(
    text: DateFormat("HH:mm")
        .format(controller.slotList[index].startTime),
    style: AppStyle.txtManropeBold18,
    children: [
    TextSpan(
    text:
    "\nto ${DateFormat("HH:mm").format(controller.slotList[index].endTime)}",
    style: AppStyle.txtManropeRegular12,
    ),
    TextSpan(
    text: "\n${controller.slotList[index].price}đ",
    style: AppStyle.txtManropeSemiBold14Red500,
    )
    ],
    ),
    ),
    ),
    ),
    );
  }
}
