// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'dart:typed_data';

import '../../core/constants/image_constant.dart';

class CourtImage {
  late String id;
  late String courtId;
  late Uint8List imgBase;

  CourtImage({required this.id, required this.courtId, required this.imgBase});

  factory CourtImage.fromJson(Map<String, dynamic> json) {
    Uint8List bytesImage;
     if (json["content"] != null) {
      bytesImage = const Base64Decoder().convert(json["content"]);
    } else {
      bytesImage = const Base64Decoder().convert(ImageConstant.noCourtBase);
    }
    return CourtImage(
      id: "",
      courtId: "",
      imgBase: bytesImage,
    );
  }

  static List<CourtImage> listFromJson(list) =>
      List<CourtImage>.from(list.map((x) => CourtImage.fromJson(x)));

  CourtImage.empty() {
    id = "";
    courtId = "";
    imgBase = const Base64Decoder().convert(ImageConstant.noCourtBase);
  }

  @override
  String toString() {
    return 'CourtImage{imgBase: $imgBase}';
  }
}
