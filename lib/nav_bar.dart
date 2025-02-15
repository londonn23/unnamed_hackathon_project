import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';



class NavBar extends StatelessWidget {
  final Function(int) onTabChange;
  const NavBar({
    super.key,
    required this.onTabChange
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
              width: 2, color: const Color.fromARGB(255, 201, 202, 201)),
          borderRadius: BorderRadius.circular(10)),
      child: GNav(
          duration: Duration(milliseconds: 300),
          backgroundColor: const Color.fromARGB(255, 201, 202, 201),
          rippleColor: Colors.green.shade700,
          tabBackgroundColor: const Color.fromARGB(255, 120, 255, 127),
          padding: EdgeInsets.all(25),
          tabBorderRadius: 15,
          iconSize: 20,
          onTabChange: onTabChange,
          tabs: [
            GButton(
              icon: Icons.home,
              text: 'Home',
            ),
            GButton(
              icon: Icons.thumb_up_sharp,
              text: 'Likes',
            ),
            GButton(
              icon: Icons.add,
              iconSize: 25,
              text: 'Add',
            ),
            GButton(
              icon: Icons.chat,
              text: 'Profile',
            )
          ]),
    );
  }
}