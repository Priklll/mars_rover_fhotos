import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_from_the_rover/features/presentation/bloc/photo_bloc.dart';
import 'package:photo_from_the_rover/features/presentation/page/curiosity/photo_list_curiosity.dart';
import 'package:photo_from_the_rover/features/service/repository.dart';

class CuriosityPhoto extends StatelessWidget {
  const CuriosityPhoto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Repository photoRepository = Repository();

    return BlocProvider<PhotoBloc>(
      create: (context) => PhotoBloc(photoRepository),
      child: Scaffold(
          body: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/curiosity.jpg'),
                      fit: BoxFit.cover)),
              child: PhotoCuriosityList()
              // ],
              )),
    );

    // );
  }
}
