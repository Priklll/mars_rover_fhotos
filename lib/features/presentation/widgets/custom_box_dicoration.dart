import 'package:flutter/material.dart';

class CustomBoxDecoration extends StatelessWidget {
  const CustomBoxDecoration({Key? key, child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 300),
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 243, 243, 251),
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20)),
          boxShadow: [
            BoxShadow(color: Colors.black38, spreadRadius: 10, blurRadius: 30)
          ],
        ));
  }
}
