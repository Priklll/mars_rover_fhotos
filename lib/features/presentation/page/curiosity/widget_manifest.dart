 import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_from_the_rover/features/presentation/bloc/photo_bloc.dart';
import 'package:photo_from_the_rover/features/presentation/bloc/photo_state.dart';

class ManifestWidget extends StatelessWidget {
   const ManifestWidget({Key? key}) : super(key: key);

   @override
   Widget build(BuildContext context) {
     return BlocBuilder<PhotoBloc, PhotoState>(
     builder: (context, PhotoState state) {
       if(state is PhotoLoadingState){
         return  Row(
           mainAxisAlignment: MainAxisAlignment.center,
           children: <Widget>[
             Text('data')
           ],

         );
       }
       return CircularProgressIndicator();
     },);


   }
 }
