import 'package:photo_from_the_rover/features/models/rover.dart';

abstract class RoverEvent{}

class PhotoLoadEvent extends RoverEvent{
  PhotoLoadEvent();
}

class ManifestLoadEvent extends RoverEvent{
  ManifestLoadEvent();
}

