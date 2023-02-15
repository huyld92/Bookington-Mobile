

class CourtImage {
  String id;
  String courtId;
  String image_binary;

  CourtImage(
      {required this.id, required this.courtId, required this.image_binary});

  factory CourtImage.fromJson(Map<String, dynamic> json) => CourtImage(
        id: json["ownerId"],
        courtId: json["districtId"],
        image_binary: json["name"],
      );
}
