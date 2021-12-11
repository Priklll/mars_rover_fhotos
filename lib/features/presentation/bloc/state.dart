import 'package:flutter/foundation.dart';
import 'package:photo_from_the_rover/features/models/photo.dart';
import 'package:photo_from_the_rover/features/models/photo_manifest.dart';

abstract class PhotoState {}

class PhotoStateEmpty extends PhotoState {}

class ManifestStateEmpty extends PhotoState {}

class PhotoLoadingState extends PhotoState {}

class ManifestLoadingState extends PhotoState {}

class ManifestLoadedState extends PhotoState {
  RoverManifest loadedManifest;
  ManifestLoadedState(this.loadedManifest) : assert(loadedManifest != null);
}

class ManifestAndPhotoLoadedState extends PhotoState {
  List<Photos> loadedPhoto;
  RoverManifest loadedManifest;
  ManifestAndPhotoLoadedState(this.loadedPhoto, this.loadedManifest) : assert(loadedPhoto != null);
}

class PhotoLoadedState extends PhotoState {
   List<Photos> loadedPhoto;
  RoverManifest loadedManifest;
  PhotoLoadedState(this.loadedPhoto, this.loadedManifest) : assert(loadedPhoto != null);
}


class ErrorPhotoState extends PhotoState {}
