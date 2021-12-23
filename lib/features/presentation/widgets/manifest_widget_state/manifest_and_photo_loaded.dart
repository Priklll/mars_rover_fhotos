import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:photo_from_the_rover/features/models/photo.dart';
import 'package:photo_from_the_rover/features/models/photo_manifest.dart';

class ManifestW extends StatelessWidget {
  final RoverManifest loadedManifest;
  final List<Photos> loadedPhoto;
  final void Function(DateTime date) select;


  const ManifestW({Key? key, required this.loadedManifest, required this.loadedPhoto, required this.select}) : super(key: key);



  Future<void> _selectDate(BuildContext context) async {
    DateTime selectedDate = DateTime.parse(loadedManifest.maxDate);

    final DateTime? calendar = await showRoundedDatePicker(
        context: context,
        height: 330,
        initialDate: DateTime.parse(loadedManifest.maxDate),
        firstDate: DateTime.parse(loadedManifest.landingDate),
        lastDate: DateTime.parse(loadedManifest.maxDate),
        theme: ThemeData.light(),
        imageHeader: const AssetImage('assets/images/bg.jpg'),
        borderRadius: 30,
        listDateDisabled: getDates(loadedManifest.photos),
      );
    if (calendar != null && calendar != selectedDate) {
      selectedDate = calendar;
      print("Selected date: $selectedDate");
      select(selectedDate);
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
}