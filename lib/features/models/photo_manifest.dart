class Manifest {
  RoverManifest manifest;

  Manifest({required this.manifest});

  factory Manifest.fromJson(Map<String, dynamic> json) {
    return Manifest(manifest: RoverManifest.fromJson(json['photo_manifest']));
  }
}

class RoverManifest {
  String name;
  String landingDate;
  String launchDate;
  String status;
  int maxSol;
  String maxDate;
  int totalPhotos;

  // List<ManifestPhotoData> photo;
  // int sol;
  // String earthDate;

  RoverManifest({
    required this.name,
    required this.landingDate,
    required this.launchDate,
    required this.status,
    required this.maxSol,
    required this.maxDate,
    required this.totalPhotos,
    // required this.photo,
    // required this.sol,
    // required this.earthDate,
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
      // photo: List<ManifestPhotoData>.from(json['photos'].map((x) => ManifestPhotoData.fromJson(x))),
      // sol: json['sol'],
      // earthDate: json['earth_date']
    );
  }
}

class ManifestPhotoData {
  int sol;
  String earthDate;
  int totalPhotos;
  List<Camera> camera;

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
      camera: List<Camera>.from(json["cameras"].map((x) => Camera.fromJson(x))),
    );
  }
}

class Camera {
  String cameras;

  Camera({required this.cameras});

  factory Camera.fromJson(Map<String, dynamic> json) {
    return Camera(cameras: json['cameras']);
  }
}
