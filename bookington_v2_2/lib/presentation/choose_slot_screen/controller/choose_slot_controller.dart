import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/data/models/slot_model.dart';
import 'package:intl/intl.dart';

class ChooseSlotController extends GetxController {
  late RxList<bool> listSelected;

  // Rx<ChooseSlotModel> chooseSlotModelObj = ChooseSlotModel().obs;
  RxList<SlotModel> slotList = <SlotModel>[].obs;

  @override
  void onInit() {
    loadData();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void loadData() {
    slotList.add(SlotModel("1", "1", DateFormat("kk:mm").parse("08:00"),
        DateFormat("kk:mm").parse("09:00"), 100000, true));
    slotList.add(
      SlotModel("2", "1", DateFormat("kk:mm").parse("09:00"),
          DateFormat("kk:mm").parse("10:00"), 100000, true),
    );
    slotList.add(
      SlotModel("3", "1", DateFormat("kk:mm").parse("10:00"),
          DateFormat("kk:mm").parse("11:00"), 100000, true),
    );
    slotList.add(
      SlotModel("3", "1", DateFormat("kk:mm").parse("11:00"),
          DateFormat("kk:mm").parse("12:00"), 100000, false),
    );
    slotList.add(
      SlotModel("3", "1", DateFormat("kk:mm").parse("12:00"),
          DateFormat("kk:mm").parse("13:00"), 100000, true),
    );
    slotList.add(
      SlotModel("3", "1", DateFormat("kk:mm").parse("13:00"),
          DateFormat("kk:mm").parse("14:00"), 100000, false),
    );
    slotList.add(
      SlotModel("3", "1", DateFormat("kk:mm").parse("14:00"),
          DateFormat("kk:mm").parse("15:00"), 100000, true),
    );
    slotList.add(
      SlotModel("3", "1", DateFormat("kk:mm").parse("15:00"),
          DateFormat("kk:mm").parse("16:00"), 100000, true),
    );
    slotList.add(
      SlotModel("3", "1", DateFormat("kk:mm").parse("16:00"),
          DateFormat("kk:mm").parse("17:00"), 100000, true),
    );
    slotList.add(
      SlotModel("3", "1", DateFormat("kk:mm").parse("17:00"),
          DateFormat("kk:mm").parse("18:00"), 100000, true),
    );
    slotList.add(
      SlotModel("3", "1", DateFormat("kk:mm").parse("18:00"),
          DateFormat("kk:mm").parse("19:00"), 100000, true),
    );
    slotList.add(
      SlotModel("3", "1", DateFormat("kk:mm").parse("19:00"),
          DateFormat("kk:mm").parse("20:00"), 100000, true),
    );
    slotList.add(
      SlotModel("3", "1", DateFormat("kk:mm").parse("20:00"),
          DateFormat("kk:mm").parse("21:00"), 100000, true),
    );
    listSelected = RxList.filled(slotList.length, false);
  }

  void nextPaymentScreen() {
    Get.toNamed(AppRoutes.paymentScreen);
  }

  getBack(){
    print("choose slot back");
    // Get.back();
  }

  void selectSlot(int index) {
    listSelected[index] = !listSelected[index];
    listSelected.refresh();
  }
}
