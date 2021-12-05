import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_from_the_rover/features/presentation/bloc/bloc.dart';
import 'package:photo_from_the_rover/features/presentation/bloc/state.dart';
import 'package:photo_from_the_rover/features/presentation/bloc/event.dart';

class ManifestWidget extends StatefulWidget {
  const ManifestWidget({Key? key}) : super(key: key);

  @override
  _ManifestWidgetState createState() => _ManifestWidgetState();
}

class _ManifestWidgetState extends State<ManifestWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PhotoBloc, PhotoState>(
      builder: (context, PhotoState state) {
        if (state is PhotoLoadedState) {
          return Container(
              color: Colors.transparent,
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 170,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 243, 243, 251),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black,
                            spreadRadius: 0,
                            blurRadius: 10)
                      ],
                    ),
                    child:Center(child: Text('${state.loadedManifest.maxSol}', style: TextStyle(fontSize: 20), textAlign: TextAlign.center) ,) ,
                  ),
                  SizedBox(width: 20,),
                  Container(
                    width: 100,
                    height: 170,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 243, 243, 251),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black,
                            spreadRadius: 0,
                            blurRadius: 10)
                      ],
                    ),
                    child:Center(child: Text('${state.loadedManifest.totalPhotos}', style: TextStyle(fontSize: 20), textAlign: TextAlign.center) ,) ,
                  ),
                  SizedBox(width: 20,),
                  Container(
                    width: 100,
                    height: 170,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 243, 243, 251),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black,
                            spreadRadius: 0,
                            blurRadius: 10)
                      ],
                    ),
                    child:Center(child: Text('${state.loadedManifest.status}', style: TextStyle(fontSize: 20), textAlign: TextAlign.center) ,) ,
                  )
                ],
              ));
        }
        return CupertinoActivityIndicator();
      },
    );
  }
}