import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_from_the_rover/features/models/photo_manifest.dart';

class ManifestP extends StatelessWidget {
  final RoverManifest loadedManifest;

  const ManifestP({Key? key, required this.loadedManifest}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Padding(
        padding: const EdgeInsets.only(left: 275),
        child: ElevatedButton(
          onPressed: () {
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