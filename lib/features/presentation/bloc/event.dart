import 'package:photo_from_the_rover/features/models/photo_manifest.dart';

abstract class RoverEvent {}

class StartManifestLoadingEvent extends RoverEvent {
  StartManifestLoadingEvent();
}

class StartAllPhotosLoadingEvent extends RoverEvent {
  final RoverManifest manifest;
  StartAllPhotosLoadingEvent(this.manifest);
}