import 'package:flutter/material.dart';
import 'package:photo_from_the_rover/features/models/rover.dart';
import 'package:photo_from_the_rover/features/presentation/page/rover_photo/photo_window.dart';
import 'package:photo_from_the_rover/features/service/repository.dart';

class RoverCard extends StatelessWidget {
  final Rover rover;

  const RoverCard({Key? key, required this.rover}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Repository photoRepository = Repository(rover);

    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 40,
        color: const Color.fromARGB(255, 243, 243, 251),
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (c, a1, a2) =>
                      CuriosityPhoto(photoRepository: photoRepository),
                  transitionsBuilder: (c, anim, a2, child) =>
                      FadeTransition(opacity: anim, child: child),
                  transitionDuration: const Duration(milliseconds: 800),
                ));
          },
          child: SizedBox(
              width: 327,
              height: 130,
              child: Row(
                children: <Widget>[
                  Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black38,
                                spreadRadius: 10,
                                blurRadius: 30)
                          ],
                          border: Border.all(color: Colors.white),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: getImage(rover)))),
                  const SizedBox(width: 30),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 10),
                      Text(
                        getTitle(rover),
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )
                    ],
                  )
                ],
              )),
        ));
  }

  AssetImage getImage(Rover rover) {
    switch (rover) {
      case Rover.curiosity: return const AssetImage('assets/images/curiosity.jpg');
      case Rover.opportunity: return const AssetImage('assets/images/opportunity.jpg');
      case Rover.spirit: return const AssetImage('assets/images/spirit.jpg');
    }
  }

  String getTitle(Rover rover) {
    switch (rover) {
      case Rover.curiosity: return 'Curiosity';
      case Rover.opportunity: return 'Opportunity';
      case Rover.spirit: return 'Spirit';
    }
  }
}