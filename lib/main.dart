import 'package:flutter/material.dart';
import 'package:unnamed_hackathon_project/chat.dart';
import 'package:unnamed_hackathon_project/test_page.dart';
import 'trash_selection.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

void main() {
  runApp(MaterialApp(home: MainApp()));
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  PageController pCont = PageController(initialPage: 0);
  int selectedPage = 0;

  void _onTabChange(int index) {
    pCont.jumpToPage(index); // Navigate using PageView
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(),
          body: PageView(
            controller: pCont,
            physics: NeverScrollableScrollPhysics(),
            onPageChanged: (value) {
              selectedPage = value;
              setState(() {
              });
            },
            children: [
              TestPage(),
              TrashSelection(),
              ChatBot()
            ],
          ),
          bottomNavigationBar: NavBar(onTabChange: _onTabChange),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

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