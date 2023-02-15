class ReportModel {
  late String _id;
  late String _refCourt;
  late String _reporterId;
  late String _content;

  ReportModel(this._id, this._refCourt, this._reporterId, this._content);

  ReportModel.forReport(this._refCourt, this._content);

  String get content => _content;

  set content(String value) {
    _content = value;
  }

  String get reporterId => _reporterId;

  set reporterId(String value) {
    _reporterId = value;
  }

  String get refCourt => _refCourt;

  set refCourt(String value) {
    _refCourt = value;
  }

  String get id => _id;

  set id(String value) {
    _id = value;
  }

  factory ReportModel.fromJson(Map<String, dynamic> json) => ReportModel(
        json["id"],
        json["refCourt"],
        json["reporterId"],
        json["content"],
      );

  static List<ReportModel> listFromJson(list) =>
      List<ReportModel>.from(list.map((x) => ReportModel.fromJson(x)));
}
