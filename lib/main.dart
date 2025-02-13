import 'package:flutter/material.dart';
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
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  void _onTabChange(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.jumpToPage(index); // Navigate using PageView
  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(),
          body: Center(
            child: SizedBox(
              width: 200,
              height: 100,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TrashSelection()),
                  );
                },
                style: TextButton.styleFrom(backgroundColor: Colors.blue),
                child: Text(
                  "go to page 2",
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ),
          ),
          bottomNavigationBar: NavBar(),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class NavBar extends StatelessWidget {
  const NavBar({
    super.key,
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
          onTabChange: (index) {
            if (index == 1) {
              Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TrashSelection()),
                  );
            }
          },
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
