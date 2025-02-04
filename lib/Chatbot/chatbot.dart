import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget{
  const ChatPage({super.key});
  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage>{

  final ChatUser _currentUser = ChatUser(id:'1', firstName: 'Calvin', lastName: 'Sentosa');
  final ChatUser _gptChatUser = ChatUser(id:'2', firstName: 'Chat', lastName: 'GPT');

  List<ChatMessage> _messages = <ChatMessage>[];

  @override
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(0, 126, 126, 1),
        title: const Text(
          'Hiro Chatbot',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: DashChat(
        currentUser: _currentUser, 
        onSend: (ChatMessage m){
          getChatResponse(m);
        }, 
        messages: _messages),
    );
  }
  Future<void> getChatResponse(ChatMessage m)async{
    
  }
}