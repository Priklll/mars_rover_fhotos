import 'package:photo_from_the_rover/features/models/photo.dart';
import 'package:photo_from_the_rover/features/models/photo_manifest.dart';
import 'package:photo_from_the_rover/features/models/rover.dart';
import 'package:photo_from_the_rover/features/service/network_service.dart';

class Repository {
  final NetworkService _networkService = NetworkService();
  final Rover rover;

  Repository(this.rover);

  List<Photos> photos = [];
  
  Future<RoverManifest> getAllManifest() => _networkService.getManifest(rover);

  Future<List<Photos>> getAllPhoto(int sol) async {
    var photos = await _networkService.getPhoto(rover, sol);
    for (Photos photo in photos) {
      this.photos.add(photo);
    }
    return this.photos;
  }
}
