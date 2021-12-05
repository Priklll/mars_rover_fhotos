import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_from_the_rover/features/presentation/widgets/navigator_bar.dart';
import 'package:photo_from_the_rover/features/presentation/widgets/rover_card.dart';

class RoverList extends StatelessWidget {
  const RoverList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        bottomNavigationBar: NavBar(),
        backgroundColor: Colors.transparent,
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/bg.jpg'),
                  fit: BoxFit.cover)),
          child: Center(
              child: ListView(
                  padding: EdgeInsets.fromLTRB(24, 140, 24, 50),
                  children: <Widget>[
                CuriosityCard(),
                SizedBox(
                  height: 31,
                ),
                OpportunityCard(),
                SizedBox(
                  height: 31,
                ),
                SpiritCard(),
              ])),
        ));
  }
}
