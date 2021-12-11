import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int currentPosition = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          boxShadow: [
            BoxShadow(color: Colors.black38, spreadRadius: 10, blurRadius: 30)
          ]),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        child: BottomNavigationBar(
            elevation: 100,
            currentIndex: currentPosition,
            onTap: (i) => setState(() => currentPosition = i),
            items: [
              BottomNavigationBarItem(
                  icon: Image.asset('assets/icons/rover_icon.png',
                      width: 20, height: 20),
                  label: 'Rover'),
              BottomNavigationBarItem(
                  icon: Image.asset('assets/icons/book_icon.png',
                      width: 20, height: 20),
                  label: 'Book'),
              BottomNavigationBarItem(
                  icon: Image.asset('assets/icons/developer_icon.png',
                      width: 30, height: 20),
                  label: 'Developer')
            ]),
      ),
    );
  }
}
