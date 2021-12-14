import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:photo_from_the_rover/features/models/photo_manifest.dart';
import 'package:photo_from_the_rover/features/presentation/bloc/bloc.dart';
import 'package:photo_from_the_rover/features/presentation/bloc/state.dart';

class ManifestWidget extends StatefulWidget {
  const ManifestWidget({Key? key}) : super(key: key);

  @override
  State<ManifestWidget> createState() => _ManifestWidgetState();
}

class _ManifestWidgetState extends State<ManifestWidget> {
  @override
  Widget build(BuildContext context) {
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
          return ManifestW(loadedManifest: state.loadedManifest);
        }

        if (state is PhotoLoadedState) {
          return ManifestW(loadedManifest: state.loadedManifest);
        }

        if (state is ManifestAndPhotoLoadedState) {
          return ManifestW(loadedManifest: state.loadedManifest);
        }

        if (state is ErrorPhotoState) {
          return const ManifestLoadIndicator();
        }

        return const CupertinoActivityIndicator();
      },
    );
  }
}

class ManifestW extends StatelessWidget {
  final RoverManifest loadedManifest;

  const ManifestW({Key? key, required this.loadedManifest}) : super(key: key);



  Future<void> _selectDate(BuildContext context) async {
    DateTime selectedDate = DateTime.parse(loadedManifest.maxDate);
    final DateTime? picked = await  showRoundedDatePicker(
      context: context,
      height: 330,
      initialDate: DateTime.parse(loadedManifest.maxDate),
      firstDate: DateTime.parse(loadedManifest.landingDate),
      lastDate: DateTime.parse(loadedManifest.maxDate),
      theme: ThemeData.light(),
      imageHeader: const AssetImage('assets/images/bg.jpg'),
      borderRadius: 30,
      listDateDisabled: getDates(loadedManifest.photos),
    ) ;
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      print("Selected date: $selectedDate");
    }

  }



  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Padding(
        padding: const EdgeInsets.only(left: 275),
        child: ElevatedButton(
          onPressed: () {
           _selectDate(context);
          },
          style: ElevatedButton.styleFrom(
              primary: const Color.fromARGB(255, 243, 243, 251),
              minimumSize: const Size(10, 30)),
          child: const Icon(
            Icons.event,
            color: Colors.black,
          ),
        ),
      ),
      const SizedBox(height: 50),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
              height: 45,
              width: 90,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 243, 243, 251),
                borderRadius: BorderRadius.circular(15),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black, spreadRadius: 0, blurRadius: 10)
                ],
              ),
              child: Center(
                  child: Text('${loadedManifest.maxSol}',
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                      textAlign: TextAlign.center))),
          const SizedBox(
            width: 30,
          ),
          Container(
              height: 45,
              width: 90,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 243, 243, 251),
                borderRadius: BorderRadius.circular(15),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black, spreadRadius: 0, blurRadius: 10)
                ],
              ),
              child: Center(
                child: Text('${loadedManifest.totalPhotos}',
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    textAlign: TextAlign.center),
              )),
          const SizedBox(
            width: 30,
          ),
          Container(
              height: 45,
              width: 90,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 243, 243, 251),
                borderRadius: BorderRadius.circular(15),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black, spreadRadius: 0, blurRadius: 10)
                ],
              ),
              child: Center(
                child: Text(loadedManifest.status,
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    textAlign: TextAlign.center),
              ))
        ],
      )
    ]);
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

    // final difference = photosDates.last.difference(photosDates.first).inDays;
    // for (int i = 0; i < difference; i++) {
    //  DateTime date2 = DateTime(date.year, date.month, date.day + i);
    //   if (!photosDates.contains(date2)) {
    //
    //     _dates.add(date2);
    //   }
    // }
    // print(_dates.length);
  }
}

class ManifestLoadIndicator extends StatelessWidget {
  const ManifestLoadIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.transparent,
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                width: 90,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 243, 243, 251),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black, spreadRadius: 0, blurRadius: 10)
                  ],
                ),
                child: const Center(child: CupertinoActivityIndicator())),
            const SizedBox(
              width: 30,
            ),
            Container(
                width: 90,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 243, 243, 251),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black, spreadRadius: 0, blurRadius: 10)
                  ],
                ),
                child: const Center(child: CupertinoActivityIndicator())),
            const SizedBox(
              width: 30,
            ),
            Container(
                width: 90,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 243, 243, 251),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black, spreadRadius: 0, blurRadius: 10)
                  ],
                ),
                child: const Center(child: CupertinoActivityIndicator()))
          ],
        ));
  }
}

