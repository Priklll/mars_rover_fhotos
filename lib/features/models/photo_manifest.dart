class RoverManifest {
  String name;
  String landingDate;
  String launchDate;
  String status;
  int maxSol;
  String maxDate;
  int totalPhotos;
  List<ManifestPhotoData> photos;

  RoverManifest({
    required this.name,
    required this.landingDate,
    required this.launchDate,
    required this.status,
    required this.maxSol,
    required this.maxDate,
    required this.totalPhotos,
    required this.photos,
  });

  factory RoverManifest.fromJson(Map<String, dynamic> json) {
    return RoverManifest(
      name: json['name'],
      landingDate: json['landing_date'],
      launchDate: json['launch_date'],
      status: json['status'],
      maxSol: json['max_sol'],
      maxDate: json['max_date'],
      totalPhotos: json['total_photos'],
      photos: List<ManifestPhotoData>.from(
          json['photos'].map((x) => ManifestPhotoData.fromJson(x))),
    );
  }
}

class ManifestPhotoData {
  int sol;
  String earthDate;
  int totalPhotos;
  List<dynamic> camera;

  ManifestPhotoData(
      {required this.sol,
      required this.earthDate,
      required this.totalPhotos,
      required this.camera});

  factory ManifestPhotoData.fromJson(Map<String, dynamic> json) {
    return ManifestPhotoData(
      sol: json['sol'],
      earthDate: json['earth_date'],
      totalPhotos: json['total_photos'],
      camera: json["cameras"],
    );
  }
}

// class Camera {
//   List<String> cameras;
//
//   Camera({required this.cameras});
//
//   factory Camera.fromJson(Map<String, dynamic> json) {
//     return Camera(cameras: json['cameras']);
//   }
// }
