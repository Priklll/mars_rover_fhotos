import 'package:photo_from_the_rover/features/models/photo.dart';
import 'package:photo_from_the_rover/features/models/photo_manifest.dart';
import 'package:photo_from_the_rover/features/models/rover.dart';
import 'package:photo_from_the_rover/features/service/network_service.dart';

class Repository {
  final String earthDate;
  final Rover rover;
  final NetworkService _networkService = NetworkService();

  Repository(this.rover, this.earthDate);

  Future<List<Photos>> getAllPhoto() => _networkService.getPhoto(rover, earthDate);

  Future<RoverManifest> getAllManifest() => _networkService.getManifest(rover);
}
