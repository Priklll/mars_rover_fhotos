import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_from_the_rover/features/models/rover.dart';
import 'package:photo_from_the_rover/features/presentation/bloc/bloc.dart';
import 'package:photo_from_the_rover/features/presentation/bloc/event.dart';
import 'package:photo_from_the_rover/features/presentation/page/rover_photo/photo_gridlist.dart';
import 'package:photo_from_the_rover/features/presentation/page/rover_photo/manifest.dart';
import 'package:photo_from_the_rover/features/service/repository.dart';

class CuriosityPhoto extends StatelessWidget {
  final Repository photoRepository;

  const CuriosityPhoto({Key? key, required this.photoRepository})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PhotoBloc photoBloc = PhotoBloc(photoRepository);
    photoBloc.add(StartManifestLoadingEvent());

    return BlocProvider<PhotoBloc>(
      create: (context) => photoBloc,
      child: Scaffold(
          body: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: getBackgroundImage(photoRepository.rover),
                      fit: BoxFit.cover)),
              child: Column(
                children: [
                  const SizedBox(
                    height: 80,
                  ),
                  const Expanded(child: ManifestWidget(), flex: 1),
                  Expanded(
                    child: PhotoCuriosityList(),
                    flex: 3,
                  )
                ],
              ))),
    );
  }

  AssetImage getBackgroundImage(Rover rover) {
    switch (rover) {
      case Rover.curiosity: return const AssetImage('assets/images/curiosity_bg.png');
      case Rover.opportunity: return const AssetImage('assets/images/opportunity_bg.jpg');
      case Rover.spirit: return const AssetImage('assets/images/spirit_bg.jpg');
    }
  }
}
