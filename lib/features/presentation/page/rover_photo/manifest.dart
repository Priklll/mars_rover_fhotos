import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_from_the_rover/features/presentation/bloc/bloc.dart';
import 'package:photo_from_the_rover/features/presentation/bloc/state.dart';
import 'package:photo_from_the_rover/features/presentation/widgets/manifest_load_indicator.dart';
import 'package:photo_from_the_rover/features/presentation/widgets/manifest_widget_state/manifest_and_photo_loaded.dart';
import 'package:photo_from_the_rover/features/presentation/widgets/manifest_widget_state/manifest_loaded.dart';


class ManifestWidget extends StatelessWidget {
  const ManifestWidget({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<PhotoBloc, PhotoState>(
      builder: (context, PhotoState state) {
        switch (state.runtimeType) {
          case ManifestLoadingState:
            return const ManifestLoadIndicator();

          case ErrorManifestLoadingState:
            return const ManifestLoadIndicator(); // TODO: Add state UI

          case PhotoLoadingState:
            state as PhotoLoadingState;

            return ManifestP(loadedManifest: state.loadedManifest);

          case ErrorPhotoLoadingState:
            return const ManifestLoadIndicator(); // TODO: Add state UI

          case PhotoLoadedState:
            state as PhotoLoadedState;

            return ManifestW(loadedManifest: state.loadedManifest, loadedPhoto: state.loadedPhoto);
        }

        return const CupertinoActivityIndicator(); // TODO: Research about different indicators
      },
    );
  }
}





