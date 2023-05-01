class TopUpModel {
  late String partnerCode;
  late String orderId;
  late String requestId;
  late String amount;
  late int responseTime;
  late String message;
  late int resultCode;
  late String payUrl;
  late String deeplink;
  late String deeplinkMiniApp;

  TopUpModel(
      {required this.partnerCode,
      required this.orderId,
      required this.requestId,
      required this.amount,
      required this.responseTime,
      required this.message,
      required this.resultCode,
      required this.payUrl,
      required this.deeplink,
      required this.deeplinkMiniApp});

  factory TopUpModel.fromJson(Map<String, dynamic> json) => TopUpModel(
      partnerCode: json["partnerCode"],
      orderId: json["orderId"],
      requestId: json["requestId"],
      amount: json["amount"].toString(),
      responseTime: json["responseTime"],
      message: json["message"],
      resultCode: json["resultCode"],
      payUrl: json["payUrl"],
      deeplink: json["deeplink"],
      deeplinkMiniApp: json["deeplinkMiniApp"]);

  static List<TopUpModel> listFromJson(list) =>
      List<TopUpModel>.from(list.map((x) => TopUpModel.fromJson(x)));
}
