import 'dart:convert';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project_android_studio/Services/globals.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final ChatUser _currentUser = ChatUser(id: '1', firstName: 'You');
  final ChatUser _gptUser = ChatUser(id: '2', firstName: 'HIRO');
  List<ChatMessage> _messages = [
    ChatMessage(
      user: ChatUser(id: '2', firstName: 'HIRO'),
      createdAt: DateTime.now(),
      text: "Hello! My name is HIRO, I am your personal mental health care companion. How can I help you today?",
    ),
  ];

  Future<void> sendMessage(ChatMessage message) async {
    setState(() {
      _messages.insert(0, message);
    });

    final response = await http.post(
      Uri.parse(baseURL + '/chat'),
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
      backgroundColor: const Color(0xFFF7F4F2), // Warna kolom chat putih
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage("assets/HIRO_nobg.png"), // Avatar HIRO
              radius: 20,
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "HIRO",
                  style: TextStyle(
                    color: Color(0xFF4F3422), // Warna teks HIRO
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Text(
                  "Personal Chatbot",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: DashChat(
        currentUser: _currentUser,
        onSend: sendMessage,
        messages: _messages,
        messageOptions: MessageOptions(
          containerColor: Color(0xFFE8DDD9), // Warna bubble HIRO
          textColor: Colors.black, // Warna teks di bubble HIRO
          currentUserContainerColor: Color(0xFF9BB167), // Warna bubble user
          currentUserTextColor: Colors.white, // Warna teks di bubble user
          timeTextColor: Color(0xFF9BB167), // Warna jam
        ),
        inputOptions: InputOptions(
          sendButtonBuilder: (void Function()? onSend) {
            return IconButton(
              icon: Icon(CupertinoIcons.paperplane, color: Color(0xFF9BB167)),
              onPressed: onSend,
            );
          },
          inputDecoration: InputDecoration(
            filled: true,
            fillColor: Colors.white, // Warna kolom input putih
            hintText: "Write a message...",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
      
    );
  }
}
