import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:photo_from_the_rover/features/models/photo_manifest.dart';
import 'package:photo_from_the_rover/features/models/rover.dart';
import 'package:photo_from_the_rover/features/presentation/bloc/bloc.dart';
import 'package:photo_from_the_rover/features/presentation/bloc/event.dart';
import 'package:photo_from_the_rover/features/presentation/bloc/state.dart';
import 'package:photo_from_the_rover/features/presentation/page/curiosity/photo_list_rover.dart';
import 'package:photo_from_the_rover/features/presentation/page/curiosity/manifest.dart';
import 'package:photo_from_the_rover/features/service/repository.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';

class CuriosityPhoto extends StatelessWidget {
  final Rover rover;
  final int sol;

  const CuriosityPhoto({Key? key, required this.rover, required this.sol})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Repository photoRepository = Repository(rover, sol);
    final PhotoBloc photoBloc = PhotoBloc(photoRepository, rover);
    photoBloc.add(PhotoLoadEvent());


    return BlocProvider<PhotoBloc>(
      create: (context) => photoBloc,
      child: Scaffold(
          floatingActionButton: FloatingActionButton.small(
              onPressed: () { Calendar();
                // _calendar(context);
              //   BlocProvider<PhotoBloc>(
              // create: (context) => PhotoBloc(photoRepository, rover), child: Calendar());
                },
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
    final formatter = DateFormat('yyyy, MM, dd');
    var date = await showRoundedDatePicker(
          context: context,
          height: 330,
          initialDate: DateTime.now() ,
          firstDate: DateTime(2011-11-10),
          lastDate: DateTime(2023),
          theme: ThemeData.dark(),
          imageHeader: AssetImage('assets/images/bg.jpg'),
          borderRadius: 30,
        );

       print(formatter.format(DateTime.now()));
       print(formatter.parse("2011-11-26"));

      }

}

class Calendar extends StatelessWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formatter = DateFormat('yyyy, MM, dd');
    return BlocBuilder<PhotoBloc, PhotoState>(
        builder: (context, PhotoState state) {
      // final PhotoBloc photoBloc = BlocProvider.of<PhotoBloc>(context);
      // photoBloc.add(PhotoLoadEvent());
      if (state is PhotoLoadedState) {
        showRoundedDatePicker(
          context: context,
          height: 330,
          initialDate: formatter.parse(state.loadedManifest.maxDate),
          firstDate: formatter.parse(state.loadedManifest.landingDate),
          lastDate: formatter.parse(state.loadedManifest.maxDate),
          theme: ThemeData.dark(),
          imageHeader: AssetImage('assets/images/bg.jpg'),
          borderRadius: 30,
        );
      }

      return const CupertinoActivityIndicator();
    });
  }
}
