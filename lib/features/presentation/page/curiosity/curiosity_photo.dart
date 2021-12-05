import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_from_the_rover/features/models/rover.dart';
import 'package:photo_from_the_rover/features/presentation/bloc/bloc.dart';
import 'package:photo_from_the_rover/features/presentation/page/curiosity/photo_list_rover.dart';
import 'package:photo_from_the_rover/features/presentation/page/curiosity/manifest.dart';
import 'package:photo_from_the_rover/features/service/repository.dart';

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
                  showDatePicker(context: context,
                      builder: (context, child){
                    return Theme(
                      data: Theme.of(context).copyWith(
                        colorScheme: const ColorScheme.light(
                            primary: Colors.orangeAccent,
                            // header background color
                            onPrimary: Colors.black,
                            // header text color
                            onSurface: Colors.black,
                            onBackground: Colors.blueGrey,
                            background: Colors.blueGrey // body text color
                        ),
                        textButtonTheme: TextButtonThemeData(
                          style: TextButton.styleFrom(
                            primary: Colors.deepOrange[500], // button text color
                          ),
                        ),
                      ),
                    child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)), child: child,),);
                      },
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2010),
                      lastDate: DateTime(2025)
                  ),
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

// _selectDate(BuildContext context) async {
//   final DateTime? selected = await showDatePicker(
//     builder: (context, child) {
//       return Theme(
//         data: Theme.of(context).copyWith(
//           colorScheme: const ColorScheme.light(
//               primary: Colors.redAccent,
//               // header background color
//               onPrimary: Colors.black,
//               // header text color
//               onSurface: Colors.black,
//               onBackground: Colors.blueGrey,
//               background: Colors.blueGrey // body text color
//           ),
//           textButtonTheme: TextButtonThemeData(
//             style: TextButton.styleFrom(
//               primary: Colors.red, // button text color
//             ),
//           ),
//         ),
//         child: child!,
//       );
//     },
//     context: context,
//     initialDate: DateTime.now(),
//     firstDate: DateTime(2010),
//     lastDate: DateTime(2025),
//   );
