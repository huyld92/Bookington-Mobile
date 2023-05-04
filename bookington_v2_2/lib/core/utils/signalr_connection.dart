import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/core/utils/app_url.dart';
import 'package:bookington_v2_2/core/utils/notify.dart';
import 'package:bookington_v2_2/core/utils/pref_utils.dart';
import 'package:bookington_v2_2/main.dart';
import 'package:bookington_v2_2/presentation/home_screen/controller/home_controller.dart';
import 'package:bookington_v2_2/presentation/notification_screen/controller/notification_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:signalr_netcore/signalr_client.dart';

class SignalrConnection extends ChangeNotifier {
  static late HubConnection hubConnection;

  Future<void> startConnection() async {
    await recreateConnection();
    print('hubConnection Started');
  }

  Future recreateConnection() async {
    hubConnection = HubConnectionBuilder()
        .withUrl(AppUrl.notificationHub,
            options: HttpConnectionOptions(
              accessTokenFactory: () =>
                  Future.value(PrefUtils.getAccessToken()),
              transport: HttpTransportType.WebSockets,
            ))
        .build();
    hubConnection.onclose(
        ({error}) async => await retryUntilSuccessfulConnection(error));

    await hubConnection.start();

    hubConnection.on('NotificationForAllUser', (message) {
      print('NotificationForAllUser');
      // Get.find<NotificationController>().queryNotifications(1);
    });
    String userId = PrefUtils.getString("userID")!;

    print(userId);
    String connectionId = hubConnection.connectionId ?? "aaaaaaaaa";
    print(connectionId);

    await hubConnection.invoke('RegisterUserConnection', args: [userId]);

    hubConnection.on('ReceiveMessage', (message) async {
      print('ReceiveMessage: ${message![1].runtimeType}\n');
      String? mapMessage = message[1] as String?;
       Map<String, dynamic> myMap =
          Map<String, dynamic>.from(json.decode(mapMessage!));
       Notify.showBigTextNotification(
          title: "Notification",
          body: myMap["Content"],
          fln: flutterLocalNotificationsPlugin);

      // var beforestart = message!.toString();
      // Get.snackbar(
      //   'Notification',
      //   "${message[0]}",
      //   colorText: ColorConstant.black900,
      //   duration: const Duration(seconds: 2),
      //   backgroundColor: ColorConstant.whiteA700,
      //   icon: CustomImageView(
      //       width: 16, height: 16, svgPath: ImageConstant.imgNotify),
      // );
      HomeController controller = Get.find();

      controller.loadData();
    });
  }

  Future retryUntilSuccessfulConnection(Exception? exception) async {
    while (true) {
      var delayTime = Random().nextInt(20);
      await Future.delayed(Duration(seconds: delayTime));

      try {
        await recreateConnection();

        if (hubConnection.state == HubConnectionState.Connected) {
          notifyListeners();
          return;
        }
      } catch (e) {
        print('Exception here :( ${e.toString()}');
      } finally {
        print('finally:');
      }
    }
  }
}
