import 'package:bookington_v2_2/data/models/order_model.dart';
import 'package:bookington_v2_2/presentation/order_history_screen/models/booking_order_history_model.dart';
import 'package:intl/intl.dart';

class OrderHistoryModel {
  late String id;
  late String createBy;
  late String transactionId;
  late String courtName;
  late String voucherCode;
  late String orderDate;
  late String orderTime;
  late String originalPrice;
  late String totalPrice;
  late bool isPaid;
  late bool isCanceled;
  late bool isRefunded;
  late bool canBeCanceled;
  late List<BookingOrderHistoryModel> bookings;

  OrderHistoryModel(
      {required this.id,
      required this.createBy,
      required this.transactionId,
      required this.courtName,
      required this.voucherCode,
      required this.orderDate,
      required this.orderTime,
      required this.originalPrice,
      required this.totalPrice,
      required this.isPaid,
      required this.isCanceled,
      required this.isRefunded,
      required this.canBeCanceled,
      required this.bookings});

  OrderHistoryModel.empty() {
    id:
    "";
    createBy:
    "listOrder[index].createBy";
    transactionId:
    "listOrder[index].transactionI";
    courtName:
    "listOrder[index].courtName";
    voucherCode:
    "listOrder[index].voucherCode";
    orderDate:
    DateFormat("dd-MM-yyyy").format(DateTime.now());
    orderTime:
    DateFormat("HH:mm").format(DateTime.now());
    originalPrice:
    "";
    totalPrice:
    "";
    isPaid:
    false;
    isCanceled:
    false;
    isRefunded:
    false;
    canBeCanceled: false;
    bookings:
    List.empty();
  }

  static List<OrderHistoryModel> listFromListObject(
          List<OrderModel> listOrder) {
    final formatCurrency = NumberFormat("#,###");

    return List.generate(
          listOrder.length,
          (index) => OrderHistoryModel(
                id: listOrder[index].id,
                createBy: listOrder[index].createBy,
                transactionId: listOrder[index].transactionId,
                courtName: listOrder[index].courtName,
                voucherCode: listOrder[index].voucherCode,
                orderDate:
                    DateFormat("dd-MM-yyyy").format(listOrder[index].orderAt),
                orderTime: DateFormat("HH:mm").format(listOrder[index].orderAt),
                originalPrice:formatCurrency.format( listOrder[index].originalPrice),
                totalPrice: formatCurrency.format(listOrder[index].totalPrice),
                isPaid: listOrder[index].isPaid,
                isCanceled: listOrder[index].isCanceled,
                isRefunded: listOrder[index].isRefunded,
                bookings: listOrder[index].bookings,
                canBeCanceled: listOrder[index].canBeCanceled,
              ));
  }
}
