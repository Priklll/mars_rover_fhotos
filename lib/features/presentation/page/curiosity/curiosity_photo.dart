import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_from_the_rover/features/models/rover.dart';
import 'package:photo_from_the_rover/features/presentation/bloc/bloc.dart';
import 'package:photo_from_the_rover/features/presentation/page/curiosity/photo_list_rover.dart';
import 'package:photo_from_the_rover/features/presentation/page/curiosity/manifest.dart';
import 'package:photo_from_the_rover/features/service/repository.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';

class CuriosityPhoto extends StatelessWidget {
  final Rovers opportunityName;

  const CuriosityPhoto({Key? key, required this.opportunityName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Repository photoRepository = Repository();

    return BlocProvider<PhotoBloc>(
      create: (context) => PhotoBloc(photoRepository),
      child: Scaffold(
          floatingActionButton: FloatingActionButton.small(
              onPressed: () =>
                 showRoundedDatePicker
                   ( context: context,
                   height: 330,
                   initialDate: DateTime.now(),
                   firstDate: DateTime(2019),
                   lastDate: DateTime(2027),
                   theme: ThemeData.light(),
                   imageHeader: AssetImage('assets/images/bg.jpg'),
                   borderRadius: 30,),
              backgroundColor: Color.fromARGB(255, 243, 243, 251),
              child: Icon(Icons.event, color: Colors.black,)
            // Image.asset('assets/icons/calendar_icon.png', scale: 2,),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
          body: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/curiosity.jpg'),
                      fit: BoxFit.cover)),
              child: Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: 200,
                    ),
                    ManifestWidget(),
                    SizedBox(
                      height: 30,
                    ),
                    Expanded(
                      child: PhotoCuriosityList(),
                      flex: 2,
                    )
                  ],
                ),
              ))),
    );
  }
}


