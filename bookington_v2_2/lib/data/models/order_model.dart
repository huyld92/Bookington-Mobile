import 'package:bookington_v2_2/presentation/order_history_screen/models/booking_order_history_model.dart';
import 'package:intl/intl.dart';

class OrderModel {
  late String id;
  late String createBy;
  late String transactionId;
  late String courtName;
  late String voucherCode;
  late DateTime orderAt;
  late double originalPrice;
  late double totalPrice;
  late bool isPaid;
  late bool isCanceled;
  late bool isRefunded;
  late bool canBeCanceled;
  late List<BookingOrderHistoryModel> bookings;

  OrderModel(
      {required this.id,
      required this.createBy,
      required this.transactionId,
      required this.courtName,
      required this.voucherCode,
      required this.orderAt,
      required this.originalPrice,
      required this.totalPrice,
      required this.isPaid,
      required this.isCanceled,
      required this.isRefunded,
      required this.canBeCanceled,
      required this.bookings});

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json["id"] ?? "",
      createBy: json["createBy"] ?? "",
      transactionId: json["transactionId"] ?? "",
      courtName: json["courtName"] ?? "Phu Tho",
      voucherCode: json["voucherCode"] ?? "",
      orderAt: DateFormat("yyyy-MM-ddTKK:mm:ss").parse(json["orderAt"]),
      originalPrice: json["originalPrice"] * 1.0 ?? 0.0,
      totalPrice: json["totalPrice"] * 1.0 ?? 0.0,
      isPaid: json["isPaid"] ?? false,
      isCanceled: json["isCanceled"] ?? false,
      isRefunded: json["isRefunded"] ?? false,
      bookings: json["bookings"] == null
          ? List.empty()
          : BookingOrderHistoryModel.listFromJson(json["bookings"]),
      canBeCanceled: json["canBeCanceled"] ?? false,
    );
  }

  static List<OrderModel> listFromJson(list) {
    return List<OrderModel>.from(
        list.map((dynamic x) => OrderModel.fromJson(x)));
  }
}
