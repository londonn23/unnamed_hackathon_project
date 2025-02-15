import 'package:flutter/material.dart';
// import 'package:unnamed_hackathon_project/main.dart';

import 'trash_selection.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
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
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
