import 'package:flutter/material.dart';
import 'trash_selection.dart';

void main() {
  runApp(MaterialApp(home:  MainApp() ) );
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
      ),
    );
  }
}
