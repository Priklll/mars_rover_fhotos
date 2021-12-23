import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:photo_from_the_rover/features/models/photo_manifest.dart';
import 'package:photo_from_the_rover/features/models/rover.dart';
import 'package:photo_from_the_rover/features/presentation/bloc/bloc.dart';
import 'package:photo_from_the_rover/features/presentation/bloc/event.dart';
import 'package:photo_from_the_rover/features/presentation/page/rover_photo/photo_gridlist.dart';
import 'package:photo_from_the_rover/features/presentation/page/rover_photo/manifest.dart';
import 'package:photo_from_the_rover/features/service/repository.dart';

class CuriosityPhoto extends StatelessWidget {
  final Repository photoRepository;

  const CuriosityPhoto({Key? key, required this.photoRepository}) : super(key: key);

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

  Future<void> _selectDate(BuildContext context, RoverManifest manifest, PhotoBloc bloc) async {
    DateTime selectedDate = DateTime.parse(manifest.maxDate);

    final DateTime? calendar = await showRoundedDatePicker(
      context: context,
      height: 330,
      initialDate: DateTime.parse(manifest.maxDate),
      firstDate: DateTime.parse(manifest.landingDate),
      lastDate: DateTime.parse(manifest.maxDate),
      theme: ThemeData.light(),
      imageHeader: const AssetImage('assets/images/bg.jpg'),
      borderRadius: 30,
      listDateDisabled: getDates(manifest.photos),
    );
    if (calendar != null && calendar != selectedDate) {
      selectedDate = calendar;
      print("Selected date: $selectedDate");

      bloc.add(SelectedDateEvent(selectedDate));
    }
  }

  List<DateTime> getDates(List<ManifestPhotoData> photos) {
    final photosDates =
    photos.map((photo) => DateTime.parse(photo.earthDate)).toList();
    List<DateTime> _dates = [];
    DateTime date = photosDates.first;
    while (date != photosDates.last) {
      if (!photosDates.contains(date)) {
        _dates.add(date);
      }
      date = DateTime(date.year, date.month, date.day + 1);
    }
    print(_dates.length);
    return _dates;
  }
}
