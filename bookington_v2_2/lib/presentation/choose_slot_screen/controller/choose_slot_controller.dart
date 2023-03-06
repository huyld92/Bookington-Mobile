import 'dart:convert';

import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/data/apiClient/api_client.dart';
import 'package:bookington_v2_2/data/models/booking_model.dart';
import 'package:bookington_v2_2/data/models/slot_model.dart';
import 'package:intl/intl.dart';

class ChooseSlotController extends GetxController {
  late RxList<bool> listSelected;

  RxList<SlotModel> slotList = <SlotModel>[].obs;
  String courtID = "";
  RxString courtName = "".obs;
  RxString playDate = "".obs;

  @override
  void onInit() {
    loadData();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void loadData() {
    try {
      Map<String, String> arg = Get.arguments;
      if (arg["id"] != null) {
        courtID = arg["id"]!;
        courtName.value = arg["name"]!;
        playDate.value = arg["playDate"]!;
        getAvailableSlot();
      } else {
        getBack();
      }
    } catch (e) {
      e.printError();
    }
  }

  void selectSlot(int index) {
    listSelected[index] = !listSelected[index];
    listSelected.refresh();
  }

  void getAvailableSlot() {
    try {
      ApiClient.getAvailableSlot(courtID, playDate.value).then((result) {
        print('statusCode: ${result.statusCode}');
        if (result.statusCode == 200) {
          var jsonResult = jsonDecode(result.body);
          slotList.value =
              SlotModel.listFromJson(jsonResult["result"]["slots"]);
          listSelected = RxList.filled(slotList.length, false);
          slotList.refresh();
          listSelected.refresh();
        } else {
          print(result.headers);
        }
      });
    } catch (error) {
      print("Choose slot: " + error.toString());
    }
  }

  void nextPaymentScreen() {
    if (listSelected.contains(true)) {
      List<Map<String, String>> listSlotBooking = [];
      for (int i = 0; i < listSelected.length; i++) {
        if (listSelected[i]) {
          Map<String, String> body = {
            "refSlot": slotList[i].id,
            "playDate": playDate.value
          };
          listSlotBooking.add(body);
        }
      }
      print('listBooking: $listSlotBooking');

      ApiClient.createNewBooking(listSlotBooking)
          .then((result) {
        print('createNewBooking statusCode: ${result.statusCode}');
        if (result.statusCode == 201) {
          var jsonResult = jsonDecode(result.body);
          List<BookingModel> listBooking =
              BookingModel.listFromJson(jsonResult["result"]);
           Map<String,dynamic> arg = {
            "listBooking":listBooking,
          };
          print('listBooking: $listBooking');
          Get.toNamed(AppRoutes.paymentScreen,arguments: arg);
        } else {
          print(result.headers);
        }
      });
    }
  }

  getBack() {
    print("choose slot back");
    Get.back();
  }
}
