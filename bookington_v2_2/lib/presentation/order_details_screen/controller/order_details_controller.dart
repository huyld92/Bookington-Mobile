import 'dart:convert';

import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/data/apiClient/api_client.dart';
import 'package:bookington_v2_2/presentation/order_history_screen/models/order_history_model.dart';

class OrderDetailsController extends GetxController with StateMixin {
  Rx<OrderHistoryModel> orderHistory = OrderHistoryModel.empty().obs;

  @override
  void onInit() {
    loadData();
    super.onInit();
  }

  void loadData() {
    try {
      Map<String, dynamic>? arg = Get.arguments;
      if (arg != null) {
        orderHistory.value = arg["orderDetails"];
        print(orderHistory.value.id);
      }
    } on Exception catch (e) {
      print('null');
    }
  }

  Future<void> cancelOrder() async {
    print('cancel');
    try {
       String orderId = orderHistory.value.id;
       print(orderId);
      await ApiClient.cancelOrder(orderId).then((result) {
        if (result.statusCode == 200) {
            Get.snackbar("Cancel order", "Cancel order success!");
            Get.back();
        } else if (result.statusCode == 401 || result.statusCode == 403) {
          logout();
        } else {
          Logger.log(
              "OrderHistoryController error at getOrderHistory: ${result.statusCode}, \n${result.body}");
        }
      });
    } catch (e) {
      Logger.log(
          "OrderHistoryController ERROR at getOrderHistory: ${e.toString()}");
    } finally {
      change(null, status: RxStatus.success());
    }
  }

  void logout() {
    PrefUtils.clearPreferencesData();
    Map<String, bool> arg = {"timeOut": true};
    Get.offAllNamed(AppRoutes.loginScreen, arguments: arg);
  }

  void getBack() {
    Get.back();
  }
}
