import 'dart:convert';

import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/data/apiClient/api_client.dart';
import 'package:bookington_v2_2/data/models/booking_model.dart';
import 'package:bookington_v2_2/data/models/slot_model.dart';
import 'package:bookington_v2_2/presentation/payment_screen/models/payment_model.dart';
import 'package:bookington_v2_2/presentation/profile_screen/controller/profile_controller.dart';
import 'package:intl/intl.dart';

class ChooseSlotController extends GetxController with StateMixin {
  late RxList<bool> listSelected = <bool>[].obs;

  RxList<SlotModel> slotList = <SlotModel>[].obs;
  String courtId = "";
  String subCourtID = "";
  RxString courtName = "".obs;
  Rx<DateTime> playDate = DateTime.now().obs;

  @override
  void onInit() {
    loadData();
    super.onInit();
  }

  Future<void> loadData() async {
    try {
      Map<String, String> arg = Get.arguments;
      if (arg["courtId"] != null) {
        courtId = arg["courtId"]!;
        subCourtID = arg["subCourtId"]!;
        courtName.value = arg["name"]! ;
        playDate.value = DateFormat("dd-MM-yyyy").parse(arg["playDate"]!);
       await getAvailableSlot();
      } else {
        getBack();
      }
    } catch (e) {
      e.printError();
    }
  }

  void selectSlot(int index) {
    if (listSelected.contains(true)) {
      int firstIndex =  listSelected.indexOf(true);
      int lastIndex = listSelected.lastIndexOf(true);
      if(index == firstIndex || index == lastIndex){
        listSelected[index] = !listSelected[index];
      } else if(index == firstIndex -1 || index == lastIndex + 1){
        listSelected[index] = !listSelected[index];
      } else if(index > firstIndex && index < lastIndex){
        listSelected.fillRange(index, lastIndex+1, false);
      } else if(index < firstIndex-1 || index > lastIndex+1){
            listSelected.fillRange(0, listSelected.length, false);
            listSelected[index] = !listSelected[index];
      }
    } else {
      listSelected[index] = !listSelected[index];
    }
    listSelected.refresh();
  }

  Future<void> getAvailableSlot() async {
    try {
      change(null, status: RxStatus.loading());
      String strPlayDate = DateFormat("dd-MM-yyyy").format(playDate.value);
     await ApiClient.getAvailableSlot(subCourtID, strPlayDate).then((result) {
        print('getAvailableSlot statusCode: ${result.statusCode}');
        if (result.statusCode == 200) {
          var jsonResult = jsonDecode(result.body);
          slotList.value =
              SlotModel.listFromJson(jsonResult["result"]["slots"]);
          listSelected.value = RxList.filled(slotList.length, false);
          slotList.refresh();
          listSelected.refresh();
        } else if (result.statusCode == 401 || result.statusCode == 403) {
          ProfileController profileController = Get.find();
          Map<String, bool> arg = {"timeOut": true};
          profileController.logout(arg);
        } else {
          print(result.headers);
        }
      });
    } catch (error) {
      print("Choose slot: " + error.toString());
    } finally {
      Future.delayed(const Duration(milliseconds: 1500), () {
        change(null, status: RxStatus.success());
      });
      // change(null, status: RxStatus.success());
    }
  }

  // void nextPaymentScreen() {Get.toNamed(AppRoutes.paymentScreen );}
  Future<void> nextPaymentScreen() async {
    if (listSelected.contains(true)) {
      List<Map<String, String>> listSlot = [];
      List<SlotModel> listSlotBooking = List.empty(growable: true);
      for (int i = 0; i < listSelected.length; i++) {
        if (listSelected[i]) {
          listSlotBooking.add(slotList[i]);
          Map<String, String> body = {
            "refSlot": slotList[i].id,
            "playDate": DateFormat("yyyy-MM-ddTHH:mm:ss").format(playDate.value),
          };
          listSlot.add(body);
        }
      }
    await  ApiClient.createNewBooking(listSlot, courtId).then((result) {
        print('createNewBooking statusCode: ${result.statusCode}');
        if (result.statusCode == 201) {
          var jsonResult = jsonDecode(result.body);
          List<BookingModel> listBooking =
          BookingModel.listFromJson(jsonResult["result"]["bookingRead"]);
          // Map<String, dynamic> arg = {
          //   "listBooking": listBooking,
          // };
          String orderId = listBooking[0].refOrder;
          PaymentModel paymentModel = PaymentModel.fromJson(jsonResult["result"]);
          print('orderId:${paymentModel.orderId}');
          paymentModel.listSlotBooking = listSlotBooking;
          paymentModel.orderId = orderId;
          paymentModel.playDate = playDate.value;
          Map<String, dynamic> arg = {
            "paymentModel": paymentModel,
          };
          Get.toNamed(AppRoutes.paymentScreen, arguments: arg);
        } else if (result.statusCode == 401 || result.statusCode == 403) {
          ProfileController profileController = Get.find();
          Map<String, bool> arg = {"timeOut": true};
          profileController.logout(arg);
        } else {
          print(result.headers);
        }
      });
    }
  }

  getBack() {
    Get.back();
  }
}
