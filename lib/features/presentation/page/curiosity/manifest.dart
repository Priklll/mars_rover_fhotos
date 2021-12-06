import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_from_the_rover/features/presentation/bloc/bloc.dart';
import 'package:photo_from_the_rover/features/presentation/bloc/state.dart';

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
                      width: 90,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 243, 243, 251),
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black,
                              spreadRadius: 0,
                              blurRadius: 10)
                        ],
                      ),
                      child: Center(
                          child: Text('${state.loadedManifest.maxSol}',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                              textAlign: TextAlign.center))),
                  SizedBox(
                    width: 30,
                  ),
                  Container(
                      width: 90,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 243, 243, 251),
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black,
                              spreadRadius: 0,
                              blurRadius: 10)
                        ],
                      ),
                      child: Center(
                        child: Text('${state.loadedManifest.totalPhotos}',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                            textAlign: TextAlign.center),
                      )),
                  SizedBox(
                    width: 30,
                  ),
                  Container(
                      width: 90,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 243, 243, 251),
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black,
                              spreadRadius: 0,
                              blurRadius: 10)
                        ],
                      ),
                      child: Center(
                        child: Text('${state.loadedManifest.status}',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                            textAlign: TextAlign.center),
                      ))
                ],
              ));
        }
        return CupertinoActivityIndicator();
      },
    );
  }
}
