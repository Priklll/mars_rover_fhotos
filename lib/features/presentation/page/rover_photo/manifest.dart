import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_from_the_rover/features/presentation/bloc/bloc.dart';
import 'package:photo_from_the_rover/features/presentation/bloc/state.dart';
import 'package:photo_from_the_rover/features/presentation/widgets/manifest_load_indicator.dart';
import 'package:photo_from_the_rover/features/presentation/widgets/manifest_widget_state/manifest_and_photo_loaded.dart';
import 'package:photo_from_the_rover/features/presentation/widgets/manifest_widget_state/manifest_loaded.dart';


class ManifestWidget extends StatelessWidget {
  // final Rover rover;
  // final String earthDate;
  const ManifestWidget({Key? key,
    // required this.rover, required this.earthDate
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Repository photoRepository = Repository(rover, earthDate);
    // final PhotoBloc photoBloc = PhotoBloc(photoRepository, rover);

    return BlocBuilder<PhotoBloc, PhotoState>(
      builder: (context, PhotoState state) {
        if (state is PhotoStateEmpty) {
          return const ManifestLoadIndicator();
        }

        if (state is ManifestStateEmpty) {
          return const ManifestLoadIndicator();
        }

        if (state is PhotoLoadingState) {
          return const ManifestLoadIndicator();
        }

        if (state is ManifestLoadingState) {
          return const ManifestLoadIndicator();
        }

        if (state is ManifestLoadedState) {
          return ManifestP(loadedManifest: state.loadedManifest);
        }

        if (state is PhotoLoadedState) {
          return ManifestW(loadedManifest:  state.loadedManifest, loadedPhoto: state.loadedPhoto);
        }

        if (state is ManifestAndPhotoLoadedState) {
          return ManifestW(loadedManifest: state.loadedManifest, loadedPhoto: state.loadedPhoto);
        }

        if (state is ErrorPhotoState) {
          return const ManifestLoadIndicator();
        }

        return const CupertinoActivityIndicator();
      },
    );
  }
}





