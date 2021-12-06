import 'package:photo_from_the_rover/features/models/photo.dart';
import 'package:photo_from_the_rover/features/models/photo_manifest.dart';
import 'package:photo_from_the_rover/features/models/rover.dart';
import 'package:photo_from_the_rover/features/service/network_service.dart';

class Repository {
  final int sol;
  final Rover rover;
  final NetworkService _networkService = NetworkService();

  Repository(this.rover, this.sol);


  Future<List<Photos>> getAllPhoto() => _networkService.getPhoto(rover, sol);

  Future<RoverManifest> getAllManifest() => _networkService.getManifest(rover);

}
