import 'dart:io';

import 'package:flutter/material.dart';

import 'features/presentation/page/rover_window.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides ();
  runApp(const Rover());

}

class Rover extends StatelessWidget {
  const Rover({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: ThemeData(primaryColor: Colors.red, fontFamily: 'NotoSerif'),
      home: RoverWindow(),
    );
  }
}

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}
