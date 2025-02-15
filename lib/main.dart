import 'package:flutter/material.dart';
import 'package:unnamed_hackathon_project/test_page.dart';
import 'trash_selection.dart';
import 'nav_bar.dart';
import 'chat.dart';

void main() {
  runApp(MaterialApp(home: MainApp()));
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final loginEmailText = Color.fromRGBO(92,123,72,1.0);
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