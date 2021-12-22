import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_from_the_rover/features/models/photo.dart';
import 'package:photo_from_the_rover/features/models/photo_manifest.dart';
import 'package:photo_from_the_rover/features/models/rover.dart';
import 'package:photo_from_the_rover/features/presentation/bloc/event.dart';
import 'package:photo_from_the_rover/features/presentation/bloc/state.dart';
import 'package:photo_from_the_rover/features/service/repository.dart';

class PhotoBloc extends Bloc<RoverEvent, PhotoState> {
  final Repository repository;

  PhotoBloc(this.repository) : super(StartState());

  @override
  Stream<PhotoState> mapEventToState(RoverEvent event) async* {
    if (event is StartManifestLoadingEvent) {
      yield ManifestLoadingState();

      try {
        final RoverManifest _loadedManifestList =
        await repository.getAllManifest();
        add(StartAllPhotosLoadingEvent(_loadedManifestList));
      } catch (error) {
        print(error);
        yield ErrorManifestLoadingState();
      }
    }

    if (event is StartAllPhotosLoadingEvent) {
      yield PhotoLoadingState(event.manifest);

      try {
        final List<Photos> _loadedPhotoList =
        await repository.getAllPhoto(event.manifest.maxSol);
        yield PhotoLoadedState(event.manifest, _loadedPhotoList);
      } catch (error) {
        print(error);
        yield ErrorPhotoLoadingState();
      }
    }
  }
}
