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
    if (event is PhotoLoadEvent) {
      yield ManifestLoadingState();
      try {
        final RoverManifest _loadedManifestList =
            await repository.getAllManifest();
        yield PhotoLoadingState(_loadedManifestList);
      } catch (error) {
        print(error);
        yield ErrorPhotoLoadingState();
      }

      try {
        final RoverManifest _loadedManifestList =
            await repository.getAllManifest();
        final List<Photos> _loadedPhotoList = await repository.getAllPhoto(200);
        yield PhotoLoadedState(_loadedPhotoList, _loadedManifestList);
      } catch (error) {}
    }
  }
}
