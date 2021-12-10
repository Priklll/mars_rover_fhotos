import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_from_the_rover/features/models/rover.dart';
import 'package:photo_from_the_rover/features/presentation/bloc/bloc.dart';
import 'package:photo_from_the_rover/features/presentation/bloc/state.dart';
import 'package:photo_from_the_rover/features/presentation/page/curiosity/photo_list_rover.dart';
import 'package:photo_from_the_rover/features/presentation/page/curiosity/manifest.dart';
import 'package:photo_from_the_rover/features/service/repository.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:intl/intl.dart';

class CuriosityPhoto extends StatelessWidget {
  final Rover rover;
  final int sol;

  const CuriosityPhoto({Key? key, required this.rover, required this.sol})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Repository photoRepository = Repository(rover, sol);
    return BlocProvider<PhotoBloc>(
      create: (context) => PhotoBloc(photoRepository, rover),
      child: Scaffold(
          floatingActionButton: FloatingActionButton.small(
              onPressed: () => _calendar(context),
              backgroundColor: Color.fromARGB(255, 243, 243, 251),
              child: Icon(
                Icons.event,
                color: Colors.black,
              )),
          floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
          body: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: rover == Rover.curiosity
                          ? AssetImage('assets/images/curiosity_bg.png')
                          : rover == Rover.opportunity
                              ? AssetImage('assets/images/opportunity_bg.jpg')
                              : AssetImage('assets/images/spirit_bg.jpg'),
                      fit: BoxFit.cover)),
              child: Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: 200,
                    ),
                    ManifestWidget(),
                    SizedBox(
                      height: 30,
                    ),
                    Expanded(
                      child: PhotoCuriosityList(sol: sol),
                      flex: 2,
                    )
                  ],
                ),
              ))),
    );
  }

  Future<void> _calendar(BuildContext context) async {
    BlocBuilder<PhotoBloc, PhotoState>(
        builder: (context, PhotoState state) {
          if (state is PhotoLoadedState) {
            showRoundedDatePicker(
              context: context,
              height: 330,
              initialDate: DateTime(state.loadedManifest.landingDate as int),
              firstDate: DateTime(state.loadedManifest.launchDate as int),
              lastDate: DateTime(state.loadedManifest.landingDate as int),
              theme: ThemeData.dark(),
              imageHeader: AssetImage('assets/images/bg.jpg'),
              borderRadius: 30,
            );
          }

          return const CupertinoActivityIndicator();
        });
  }
}

class Calendar extends StatelessWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final DateFormat formatter = DateFormat('yyyy');
    return BlocBuilder<PhotoBloc, PhotoState>(
        builder: (context, PhotoState state) {
      if (state is PhotoLoadedState) {
        showRoundedDatePicker(
          context: context,
          height: 330,
          initialDate: DateTime(state.loadedManifest.landingDate as int),
          firstDate: DateTime(state.loadedManifest.launchDate as int),
          lastDate: DateTime(state.loadedManifest.landingDate as int),
          theme: ThemeData.dark(),
          imageHeader: AssetImage('assets/images/bg.jpg'),
          borderRadius: 30,
        );
      }

      return const CupertinoActivityIndicator();
    });
  }
}
