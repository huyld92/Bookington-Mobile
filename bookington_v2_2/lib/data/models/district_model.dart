
// ignore_for_file: unnecessary_getters_setters, hash_and_equals

class DistrictModel{
  late String _id;
  late String _districtName;

  DistrictModel(this._id, this._districtName);

  String get districtName => _districtName;

  set districtName(String value) {
    _districtName = value;
  }

  String get id => _id;

  set id(String value) {
    _id = value;
  }


  factory DistrictModel.fromJson(Map<String, dynamic> json) =>DistrictModel(json["id"],json["districtName"]);



  static List<DistrictModel> listNameFromJson(list) =>
      List<DistrictModel>.from(list.map((x) => DistrictModel.fromJson(x)));


  @override
  bool operator ==(Object other) {
    other as DistrictModel;
    if (other.id == _id) {
      return true;
    } else {
      return false;
    }
  }




}