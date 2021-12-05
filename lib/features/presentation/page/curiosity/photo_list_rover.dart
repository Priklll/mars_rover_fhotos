import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_from_the_rover/features/presentation/bloc/bloc.dart';
import 'package:photo_from_the_rover/features/presentation/bloc/event.dart';
import 'package:photo_from_the_rover/features/presentation/bloc/state.dart';

class PhotoCuriosityList extends StatefulWidget {
  const PhotoCuriosityList({Key? key}) : super(key: key);

  @override
  _PhotoCuriosityListState createState() => _PhotoCuriosityListState();
}

class _PhotoCuriosityListState extends State<PhotoCuriosityList> {

  Widget build(BuildContext context) {
    final PhotoBloc photoBloc = BlocProvider.of<PhotoBloc>(context);
    photoBloc.add(PhotoLoadEvent());

    return BlocBuilder<PhotoBloc, PhotoState>(
      builder: (context, PhotoState state) {
        if (state is PhotoLoadingState) {
          return Container(
              margin: EdgeInsets.only(top: 10),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 243, 243, 251),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black38, spreadRadius: 10, blurRadius: 30)
                ],
              ),
              child: const Center(child: CupertinoActivityIndicator()));
        }

        if (state is PhotoLoadedState) {
          return Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 243, 243, 251),
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20), topLeft: Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                    color: Colors.black38, spreadRadius: 10, blurRadius: 30)
              ],
            ),
            margin: EdgeInsets.only(top: 10),
            child: GridView.builder(
              itemCount: state.loadedPhoto.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 1,
                mainAxisSpacing: 1,
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) => Container(
                margin: EdgeInsets.all(16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.white, width: 2),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black38,
                          spreadRadius: 0,
                          blurRadius: 20)
                    ],
                    image: DecorationImage(
                        image: NetworkImage(
                            state.loadedPhoto[index].imgSrc.toString()),
                        fit: BoxFit.cover)),
                // child: Text('${state.loadedManifest.sol.toString()}'),
                width: 170,
                height: 120,
              ),
            ),
          );
        }

        if (state is ErrorPhotoState) {
          return Container(
              margin: const EdgeInsets.only(top: 10),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 243, 243, 251),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black38, spreadRadius: 10, blurRadius: 30)
                ],
              ),
              child: const Center(child: Text('Error')));
        }

        return Container(
            margin: const EdgeInsets.only(top: 250),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 243, 243, 251),
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20), topLeft: Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                    color: Colors.black38, spreadRadius: 10, blurRadius: 30)
              ],
            ),
            child: const Center(child: Text('Fail!')));
      },
    );
  }
}
