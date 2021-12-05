import 'package:flutter/foundation.dart';
import 'package:photo_from_the_rover/features/models/photo.dart';
import 'package:photo_from_the_rover/features/models/photo_manifest.dart';

abstract class PhotoState {}

class PhotoStateEmpty extends PhotoState {}

class PhotoLoadingState extends PhotoState {}

class PhotoLoadedState extends PhotoState {
  List<Photos> loadedPhoto;
  RoverManifest loadedManifest;
  PhotoLoadedState(@required this.loadedPhoto, this.loadedManifest) : assert(loadedPhoto != null);
}
 // class PhotoLoadedManifestState extends PhotoState {
 //   RoverManifest loadedManifest;
 //   PhotoLoadedManifestState(@required this.loadedManifest) : assert(loadedManifest != null);
 // }

class ErrorPhotoState extends PhotoState {}
