import 'package:photo_from_the_rover/features/models/photo_manifest.dart';

abstract class RoverEvent {}

class StartManifestLoadingEvent extends RoverEvent {
  StartManifestLoadingEvent();
}

class StartLastPhotosLoadingEvent extends RoverEvent {
  final RoverManifest manifest;
  StartLastPhotosLoadingEvent(this.manifest);
}

class SelectedDateEvent extends RoverEvent {
  DateTime date;
  SelectedDateEvent(this.date);
}