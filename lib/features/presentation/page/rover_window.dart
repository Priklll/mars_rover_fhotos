import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_from_the_rover/features/presentation/widgets/navigator_bar.dart';
import 'package:photo_from_the_rover/features/presentation/widgets/rover_card.dart';
import 'package:photo_from_the_rover/features/models/rover.dart';

class RoverWindow extends StatelessWidget {
  const RoverWindow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        bottomNavigationBar: NavBar(),
        backgroundColor: Colors.transparent,
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/bg.jpg'),
                  fit: BoxFit.cover)),
          child: Center(
              child: ListView(
                  padding: const EdgeInsets.fromLTRB(24, 140, 24, 50),
                  children: <Widget>[
                RoverCard(rover: Rover.curiosity),
                SizedBox(
                  height: 31,
                ),
                RoverCard(rover: Rover.opportunity),
                SizedBox(
                  height: 31,
                ),
                RoverCard(rover: Rover.spirit),
              ])),
        ));
  }
}
