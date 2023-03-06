class ChooseCourtModel {
  String id;
  String name;
  bool isAvailable;
  bool isSelected;

  ChooseCourtModel(this.id, this.name, this.isAvailable, this.isSelected);

  factory ChooseCourtModel.fromJson(Map<String, dynamic> json) =>
      ChooseCourtModel(
        json["id"],
        json["name"],
        json["isAvailable"],
        false,
      );

  static List<ChooseCourtModel> listFromJson(list) =>
      List<ChooseCourtModel>.from(
          list.map((dynamic x) => ChooseCourtModel.fromJson(x)));
}
