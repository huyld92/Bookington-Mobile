class ProvinceModel {
  late String _id;
  late String _provinceName;

  ProvinceModel(this._id, this._provinceName);

  String get provinceName => _provinceName;

  set provinceName(String value) {
    _provinceName = value;
  }

  String get id => _id;

  set id(String value) {
    _id = value;
  }

  factory ProvinceModel.fromJson(Map<String, dynamic> json) =>
      ProvinceModel(json["id"], json["provinceName"]);

  static List<ProvinceModel> listNameFromJson(list) =>
      List<ProvinceModel>.from(list.map((x) => ProvinceModel.fromJson(x)));

  @override
  bool operator ==(Object other) {
    other as ProvinceModel;
    if (other.id == _id) {
      return true;
    } else {
      return false;
    }
  }
}
