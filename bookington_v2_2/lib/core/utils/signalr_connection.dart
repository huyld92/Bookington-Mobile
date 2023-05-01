import 'dart:io';
import 'dart:math';

import 'package:bookington_v2_2/core/utils/app_url.dart';
import 'package:bookington_v2_2/core/utils/pref_utils.dart';
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
               accessTokenFactory: () => Future.value(PrefUtils.getAccessToken()),
              transport: HttpTransportType.WebSockets,
            ))
        .build();
     hubConnection.onclose(({error})  async => await retryUntilSuccessfulConnection(error) );



    hubConnection.on('NotificationForAllUser', (message) {
      print('NotificationForAllUser');
      // Get.find<NotificationController>().queryNotifications(1);
    });

    hubConnection.on('ReceiveNotification', (message) {
      print('ReceiveNotification');
      var beforestart = message![0].toString();
      // Get.find<NotificationController>().beforeStartCountdown(beforestart);
    });

    await hubConnection.start();
    print(hubConnection.connectionId);
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
