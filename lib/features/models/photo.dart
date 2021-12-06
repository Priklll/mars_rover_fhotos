class Photos {
  int id;
  int sol;
  String imgSrc;
  String earthData;
  RoverData rovers;
  Camera cameras;

  Photos({
    required this.imgSrc,
    required this.sol,
    required this.id,
    required this.earthData,
    required this.rovers,
    required this.cameras,
  });

  factory Photos.fromJson(Map<String, dynamic> json) {
    return Photos(
      imgSrc: json['img_src'],
      sol: json['sol'],
      id: json['id'],
      earthData: json['earth_date'],
      rovers: RoverData.fromJson(json['rover']),
      cameras: Camera.fromJson(json['camera']),
    );
  }
}

class Camera {
  int id;
  String name;
  int roverId;
  String fullName;

  Camera({
    required this.id,
    required this.name,
    required this.roverId,
    required this.fullName,
  });

  factory Camera.fromJson(Map<String, dynamic> json) {
    return Camera(
      id: json['id'],
      name: json['name'],
      roverId: json['rover_id'],
      fullName: json['full_name'],
    );
  }
}

class RoverData {
  int id;
  String name;
  String landingDate;
  String launchDate;
  String status;

  RoverData({
    required this.id,
    required this.name,
    required this.landingDate,
    required this.launchDate,
    required this.status,
  });

  factory RoverData.fromJson(Map<String, dynamic> json) {
    return RoverData(
        id: json['id'],
        name: json['name'],
        landingDate: json['landing_date'],
        launchDate: json['launch_date'],
        status: json['status']);
  }
}
