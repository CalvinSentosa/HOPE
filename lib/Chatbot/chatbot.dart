import 'dart:convert';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:project_android_studio/Services/globals.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final ChatUser _currentUser = ChatUser(id: '1', firstName: 'You');
  final ChatUser _gptUser = ChatUser(id: '2', firstName: 'GPT');
  List<ChatMessage> _messages = [];

  Future<void> sendMessage(ChatMessage message) async {
    setState(() {
      _messages.insert(0, message);
    });

    final response = await http.post(
      Uri.parse(baseURL + '/chat'), // Change to your Laravel API URL
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'message': message.text}),
    );

    if (response.statusCode == 200) {
      final reply = jsonDecode(response.body);
      setState(() {
        _messages.insert(
          0,
          ChatMessage(user: _gptUser, createdAt: DateTime.now(), text: reply),
        );
      });
    } else {
      setState(() {
        _messages.insert(
          0,
          ChatMessage(user: _gptUser, createdAt: DateTime.now(), text: "Error: Unable to get response"),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Chat with GPT")),
      body: DashChat(
        currentUser: _currentUser,
        onSend: sendMessage,
        messages: _messages,
      ),
    );
  }
}
