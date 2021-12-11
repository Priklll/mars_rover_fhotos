import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_from_the_rover/features/models/photo.dart';
import 'package:photo_from_the_rover/features/presentation/bloc/bloc.dart';
import 'package:photo_from_the_rover/features/presentation/bloc/state.dart';

class PhotoCuriosityList extends StatefulWidget {
  int sol;

  PhotoCuriosityList({
    Key? key,
    required this.sol,
  }) : super(key: key);

  @override
  State<PhotoCuriosityList> createState() => _PhotoCuriosityListState();
}

class _PhotoCuriosityListState extends State<PhotoCuriosityList> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PhotoBloc, PhotoState>(
      builder: (context, PhotoState state) {
        if (state is PhotoStateEmpty) {
          return const IndicatorLoad();
        }

        if (state is ManifestStateEmpty) {
          return const IndicatorLoad();
        }

        if (state is PhotoLoadingState) {
          return const IndicatorLoad();
        }

        if (state is ManifestLoadingState) {
          return const IndicatorLoad();
        }

        if (state is ManifestLoadedState) {
          return const IndicatorLoad();
        }

        if (state is PhotoLoadedState) {
          return Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 243, 243, 251),
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20), topLeft: Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                    color: Colors.black38, spreadRadius: 10, blurRadius: 30)
              ],
            ),
            margin: const EdgeInsets.only(top: 10),
            child: GridView.builder(
                itemCount: state.loadedPhoto.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return ItemBuilder(loadedPhoto: state.loadedPhoto[index]);
                }),
          );
        }

        if (state is ManifestAndPhotoLoadedState) {
          return Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 243, 243, 251),
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20), topLeft: Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                    color: Colors.black38, spreadRadius: 10, blurRadius: 30)
              ],
            ),
            margin: const EdgeInsets.only(top: 10),
            child: GridView.builder(
                itemCount: state.loadedPhoto.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return ItemBuilder(loadedPhoto: state.loadedPhoto[index]);
                }),
          );
        }

        if (state is ErrorPhotoState) {
          return Container(
              margin: const EdgeInsets.only(top: 40),
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

        return const IndicatorLoad();
      },
    );
  }
}

class ItemBuilder extends StatelessWidget {
  final Photos loadedPhoto;

  const ItemBuilder({Key? key, required this.loadedPhoto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context) => Scaffold(
                    body: Center(
                      // widthFactor: MediaQuery.of(context).size.width,
                      // heightFactor: MediaQuery.of(context).size.width,
                      child: Hero(
                        tag: 'image',
                        child: Image.network(
                          loadedPhoto.imgSrc.toString(),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  )),
        );
      },
      child: Container(
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white, width: 2),
            boxShadow: const [
              BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 20)
            ],
            image: DecorationImage(
                image: NetworkImage(loadedPhoto.imgSrc.toString()),
                fit: BoxFit.cover)),
        width: 170,
        height: 120,
      ),
    );
  }
}

class IndicatorLoad extends StatelessWidget {
  const IndicatorLoad({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 40),
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 243, 243, 251),
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20)),
          boxShadow: [
            BoxShadow(color: Colors.black38, spreadRadius: 10, blurRadius: 30)
          ],
        ),
        child: const Center(child: CupertinoActivityIndicator()));
  }
}
