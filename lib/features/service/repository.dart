import 'package:photo_from_the_rover/features/models/photo.dart';
import 'package:photo_from_the_rover/features/models/photo_manifest.dart';
import 'package:photo_from_the_rover/features/service/api_provider.dart';

class Repository{

  final Provider _photoProvider = Provider();
  Future<List<Photos>> getAllPhoto() => _photoProvider.getPhoto();

  final Provider _manifestProvider = Provider();
  Future<RoverManifest> getAllManifest() => _manifestProvider.getManifest();

}
