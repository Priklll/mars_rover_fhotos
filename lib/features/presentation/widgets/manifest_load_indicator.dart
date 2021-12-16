import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ManifestLoadIndicator extends StatelessWidget {
  const ManifestLoadIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.transparent,
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                width: 90,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 243, 243, 251),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black, spreadRadius: 0, blurRadius: 10)
                  ],
                ),
                child: const Center(child: CupertinoActivityIndicator())),
            const SizedBox(
              width: 30,
            ),
            Container(
                width: 90,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 243, 243, 251),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black, spreadRadius: 0, blurRadius: 10)
                  ],
                ),
                child: const Center(child: CupertinoActivityIndicator())),
            const SizedBox(
              width: 30,
            ),
            Container(
                width: 90,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 243, 243, 251),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black, spreadRadius: 0, blurRadius: 10)
                  ],
                ),
                child: const Center(child: CupertinoActivityIndicator()))
          ],
        ));
  }
}
