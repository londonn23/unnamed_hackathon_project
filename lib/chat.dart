import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class ChatBot extends StatefulWidget {
  const ChatBot({super.key});

  @override
  State<ChatBot> createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  final TextEditingController _userInput = TextEditingController();
  final apiKey = 'AIzaSyAdMqSVmk1Jv5W_qj25x92eUk8h7cHgkS0';
  String? response = "placeholder";

  Future<String?> talkWithGemini(String userInput) async {
    final model = GenerativeModel(
      model: 'gemini-1.5-flash-latest',
      apiKey: apiKey,
    );
    final content = [Content.text(userInput)];
    final response = await model.generateContent(content);
    return response.text;
  }

  void _sendMessage() async {
    String userMessage = _userInput.text.trim();
    if (userMessage.isNotEmpty) {
      setState(() {
        response = "generating...";
      });
      String? botResponse = await talkWithGemini(userMessage);
      setState(() {
        response = botResponse ?? "Error";
      });
      _userInput.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Center(
            child: Column(
              children: [
                Container(
                    width: 400,
                    height: 500,
                    decoration: BoxDecoration(border: Border.all()),
                    child: Text(response ?? "")),
                Padding(padding: EdgeInsets.only(top: 50)),
                SizedBox(
                  width: 400,
                  child: TextField(
                    controller: _userInput,
                    decoration: InputDecoration(border: OutlineInputBorder()),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 50)),
                ElevatedButton(
                    onPressed: _sendMessage, child: Text("Send")),
              ],
            ),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
