import 'package:bookington_v2_2/data/models/slot_model.dart';
 import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ChooseSlotModel {

  SlotModel _slotmodel;


  ChooseSlotModel(this._slotmodel);

  DateTime get startTime => _slotmodel.startTime;
  DateTime get endTime => _slotmodel.endTime;
  double get price => _slotmodel.price;
  bool get isActive => _slotmodel.isActive;



}
