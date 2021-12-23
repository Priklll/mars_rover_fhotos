import 'package:photo_from_the_rover/features/models/photo.dart';
import 'package:photo_from_the_rover/features/models/photo_manifest.dart';

abstract class PhotoState {}

class ManifestLoadingState extends PhotoState {}

class ErrorManifestLoadingState extends PhotoState {}

class PhotoLoadingState extends PhotoState {
  RoverManifest loadedManifest;
  PhotoLoadingState(this.loadedManifest);
}

class ErrorPhotoLoadingState extends PhotoState {}

class PhotoLoadedState extends PhotoState {
  List<Photos> loadedPhoto;
  RoverManifest loadedManifest;
  PhotoLoadedState(this.loadedManifest, this.loadedPhoto);
}