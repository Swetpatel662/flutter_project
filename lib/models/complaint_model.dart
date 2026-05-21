class ComplaintModel {
  final String room;
  final String title;
  final String description;
  final String status;

  ComplaintModel({
    required this.room,
    required this.title,
    required this.description,
    required this.status,
  });

  Map<String, dynamic> toJson() {
    return {
      "room": room,
      "title": title,
      "description": description,
      "status": status,
    };
  }

  // MAP → OBJECT
  factory ComplaintModel.fromJson(Map<String, dynamic> json) {
    return ComplaintModel(
      room: json["room"],
      title: json["title"],
      description: json["description"],
      status: json["status"],
    );
  }
}
