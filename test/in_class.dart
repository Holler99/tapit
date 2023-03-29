import 'package:flutter/material.dart';

import 'package:tapit/ConversationButton.dart';

Map<String, dynamic> conversationMap = {
  "conversations" : [
    <String, dynamic> {
    "con_id" : "1234",
      "title" : "Melisa",
      "last_message" : "Did you force push?",
      "timestamp" : 09149561894578297,
    },
    <String, dynamic>{
      "con_id": "1234",
      "title": "Ben",
      "last_message": "Why Bro?",
      "timestamp": 09149561894578297,
    }
    ],
};


void main() {
  runApp(const ConversationScreen());
}

class ConversationScreen extends StatelessWidget {
  const ConversationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  return MaterialApp(
    title: 'Message',
    home: Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            for (int i = 0; i < (conversationMap['conversations'] as List).length; i++)
              ConversationButton(
                  (((conversationMap['conversations'] as List)[i] as Map<String, dynamic>)['con_id'] as String),
                  (((conversationMap['conversations'] as List)[i] as Map<String, dynamic>)['title'] as String),
                  (((conversationMap['conversations'] as List)[i] as Map<String, dynamic>)['last_message'] as String),

              ),
          ],
        ),
      ),
    ),
  );
}
}