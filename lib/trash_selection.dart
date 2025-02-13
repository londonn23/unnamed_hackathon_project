// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class TrashSelection extends StatefulWidget {
  const TrashSelection({super.key});

  @override
  State<TrashSelection> createState() => _TrashSelectionState();
}

class _TrashSelectionState extends State<TrashSelection> {
  Set<String> selectedCategories = {};
  bool isGlassToggled = false; // Added
  bool isPaperToggled = false; // Added
  bool isPlasticToggled = false; // Added
  List<String> trashType = [
    "GLASS",
    "PAPER",
    "PLASTIC",
    "PLASTIC",
    "PAPER",
    "GLASS"
  ];
  @override
  Widget build(BuildContext context) {
    List<String> filteredTrashType = selectedCategories.isEmpty
    ? trashType
    : trashType.where((type) => selectedCategories.contains(type)).toList();
    filteredTrashType.sort((a, b) => a.compareTo(b));
    return MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromARGB(179, 201, 252, 119)),
      home: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(top: 40, left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "CATEGORY:",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(width: 3, color: Colors.black)),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 12,
                      ),
                      TrashButton(
                        category: "GLASS",
                        isToggled: isGlassToggled,
                        onPressed: () {
                          setState(() {
                            isGlassToggled = !isGlassToggled;
                            if (selectedCategories.contains("GLASS")) {
                                selectedCategories.remove("GLASS");
                              } else {
                                selectedCategories.add("GLASS");
                              }
                          });
                        },
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      TrashButton(
                        category: "PAPER",
                        isToggled: isPaperToggled,
                        onPressed: () {
                          setState(() {
                            isPaperToggled = !isPaperToggled;
                            if (selectedCategories.contains("PAPER")) {
                                selectedCategories.remove("PAPER");
                              } else {
                                selectedCategories.add("PAPER");
                              }
                          });
                        },
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      TrashButton(
                        category: "PLASTIC",
                        isToggled: isPlasticToggled,
                        onPressed: () {
                          setState(() {
                            isPlasticToggled = !isPlasticToggled;
                            if (selectedCategories.contains("PLASTIC")) {
                                selectedCategories.remove("PLASTIC");
                              } else {
                                selectedCategories.add("PLASTIC");
                              }
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 20),
                  child: Text(
                    "SEARCH RESULT",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: ListView.builder(
                      itemCount: filteredTrashType.length,
                      itemBuilder: (context, index) {
                        return ItemListing(trashType: filteredTrashType, index: index);
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ItemListing extends StatelessWidget {
  final List<String> trashType;
  final int index;
  const ItemListing({
    super.key,
    required this.trashType,
    required this.index
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 375,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 3, color: Colors.black),
            borderRadius: BorderRadius.circular(20)),
        child: Stack(
          children: [
            Positioned(
              top: 5, // Adjust top position
              left: 0, // Adjust left position
              child: Image.asset(
                r'assets/png-transparent-paper-recycling-symbol-materials-s-recycling-waste-recycling-bin.png', // Path to your image
                width: 250, // Set image width
                height: 200, // Set image height
              ),
            ),
            Positioned(
                top: 210,
                left: 20,
                child: Text(
                  "NAME",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                )),
            Positioned(
                top: 270,
                left: 20,
                child: Text(
                  "PRICE",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                )),
            Positioned(
                bottom: 0,
                left: 20,
                child: Text(
                  "LOCATION",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                )),
            Positioned(
                top: 5,
                right: 8,
                child: Text(
                  trashType[index],
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                )),
            Positioned(
                bottom: 5,
                right: 8,
                child: Text(
                  "DISTANCE",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ))
          ],
        ),
      ),
    );
  }
}

class TrashButton extends StatelessWidget {
  final String category;
  final bool isToggled;
  final Color defaultColor = Colors.white;
  final Color selectedColor = Color.fromARGB(255, 120, 247, 124);
  final VoidCallback onPressed;

  TrashButton(
      {super.key,
      required this.category,
      required this.onPressed,
      required this.isToggled});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            minimumSize: Size(180, 50),
            backgroundColor:
                isToggled ? Color.fromARGB(255, 120, 247, 124) : Colors.white,
            foregroundColor: Colors.black),
        child: Text(
          category,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ));
  }
}
