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
  final Rover rover;
  final String earthDate;

  const CuriosityPhoto({Key? key, required this.rover, required this.earthDate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Repository photoRepository = Repository(rover, earthDate);
    final PhotoBloc photoBloc = PhotoBloc(photoRepository, rover);
    photoBloc.add(PhotoLoadEvent());

    return BlocProvider<PhotoBloc>(
      create: (context) => photoBloc,
      child: Scaffold(
          body: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: rover == Rover.curiosity
                          ? const AssetImage('assets/images/curiosity_bg.png')
                          : rover == Rover.opportunity
                              ? const AssetImage(
                                  'assets/images/opportunity_bg.jpg')
                              : const AssetImage('assets/images/spirit_bg.jpg'),
                      fit: BoxFit.cover)),
              child: Column(
                children: [
                  const SizedBox(
                    height: 80,
                  ),
                  const Expanded(child: ManifestWidget(), flex: 1),
                  Expanded(
                    child: PhotoCuriosityList(earthDate: earthDate),
                    flex: 3,
                  )
                ],
              ))),
    );
  }
}
