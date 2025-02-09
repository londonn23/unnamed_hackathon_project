import 'package:flutter/material.dart';

class TrashSelection extends StatefulWidget {
  const TrashSelection({super.key});

  @override
  State<TrashSelection> createState() => _TrashSelectionState();
}

class _TrashSelectionState extends State<TrashSelection> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 120, right: 40, bottom: 5),
              child: Text(
                "Select type of trash",
                style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: screenHeight * 0.01),
              child: Container(
                decoration: BoxDecoration(
                    color: const Color.fromARGB(134, 81, 255, 246),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: const Color.fromARGB(255, 81, 255, 246),
                      width: 2,
                    )),
                child: SizedBox(
                  height: screenHeight * 0.62,
                  child: ListView(
                    children: [
                      SquareFrame(),
                      SquareFrame(),
                      SquareFrame(),
                      SquareFrame(),
                      SquareFrame(),
                      SquareFrame(),
                      SquareFrame(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SquareFrame extends StatelessWidget {
  const SquareFrame({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          height: 200,
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: Colors.black, // Border color
                width: 3.2,
              ) // Border width
              ),
          child: Stack(
            children: [
              // Bottom-Left Text
              const Positioned(
                bottom: 8, // Positioned 8px from the bottom
                left: 8, // Positioned 8px from the left
                child: Text(
                  "Bottom Left",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              // Bottom-Right Text
              const Positioned(
                bottom: 8, // Positioned 8px from the bottom
                right: 8, // Positioned 8px from the right
                child: Text(
                  "Bottom Right",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              // Optional: Add more texts or widgets
              const Positioned(
                top: 8, // Positioned 8px from the top
                left: 8, // Positioned 8px from the left
                child: Text(
                  "Top Left",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
