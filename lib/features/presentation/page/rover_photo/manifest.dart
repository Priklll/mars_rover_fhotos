import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_from_the_rover/features/presentation/bloc/bloc.dart';
import 'package:photo_from_the_rover/features/presentation/bloc/state.dart';
import 'package:photo_from_the_rover/features/presentation/widgets/manifest_load_indicator.dart';
import 'package:photo_from_the_rover/features/presentation/widgets/manifest_widget_state/manifest_and_photo_loaded.dart';
import 'package:photo_from_the_rover/features/presentation/widgets/manifest_widget_state/manifest_loaded.dart';

class ManifestWidget extends StatelessWidget {
  const ManifestWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _onTapButton(DateTime date) {
      print('callback $date' );
    }

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
          return ManifestW(
              loadedManifest: state.loadedManifest,
              loadedPhoto: state.loadedPhoto,
              select: _onTapButton);
        }

        if (state is ManifestAndPhotoLoadedState) {
          return ManifestW(
              loadedManifest: state.loadedManifest,
              loadedPhoto: state.loadedPhoto,
              select: _onTapButton);
        }

        if (state is ErrorPhotoState) {
          return const ManifestLoadIndicator();
        }

        return const CupertinoActivityIndicator();
      },
    );
  }
}
