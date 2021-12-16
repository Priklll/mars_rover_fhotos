import 'package:flutter/material.dart';
import 'package:photo_from_the_rover/features/models/photo.dart';
import 'package:photo_from_the_rover/features/models/rover.dart';
import 'package:photo_from_the_rover/features/presentation/page/rover_photo/photo_window.dart';

class CuriosityCard extends StatelessWidget {

  const CuriosityCard({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
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
                      const CuriosityPhoto(rover: Rover.curiosity, sol: 200),
                  transitionsBuilder: (c, anim, a2, child) =>
                      FadeTransition(opacity: anim, child: child),
                  transitionDuration: Duration(milliseconds: 800),
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
                          image: const DecorationImage(
                              fit: BoxFit.cover,
                              image:
                                  AssetImage('assets/images/curiosity.jpg')))),
                  const SizedBox(width: 30),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const <Widget>[
                      SizedBox(height: 10),
                      Text(
                        'Curiosity',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )
                    ],
                  )
                ],
              )),
        ));
  }
}

class OpportunityCard extends StatelessWidget {
  const OpportunityCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                      const CuriosityPhoto(rover: Rover.opportunity, sol: 200),
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
                          image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                  'assets/images/opportunity.jpg')))),
                  const SizedBox(width: 30),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const <Widget>[
                      SizedBox(height: 10),
                      Text(
                        'Opportunity',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )
                    ],
                  )
                ],
              )),
        ));
  }
}

class SpiritCard extends StatelessWidget {
  const SpiritCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 70,
        color: const Color.fromARGB(255, 243, 243, 251),
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (c, a1, a2) => const CuriosityPhoto(
                    rover: Rover.spirit,
                    sol: 200,
                  ),
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
                          image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/images/spirit.jpg')))),
                  const SizedBox(width: 30),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const <Widget>[
                      SizedBox(height: 10),
                      Text(
                        'Spirit',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )
                    ],
                  )
                ],
              )),
        ));
  }
}
