import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';

import 'consts.dart';

class ChatPage extends StatefulWidget{
  const ChatPage({super.key});
  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage>{

  final _openAI = OpenAI.instance.build(
    token: OPENAI_API_KEY, 
    baseOption: HttpSetup(
      receiveTimeout: const Duration(
        seconds: 5,
      ),
    ),
    enableLog: true,
  );

  final ChatUser _currentUser = ChatUser(id:'1', firstName: 'Calvin', lastName: 'Sentosa');
  final ChatUser _gptChatUser = ChatUser(id:'2', firstName: 'Chat', lastName: 'GPT');

  List<ChatMessage> _messages = <ChatMessage>[];
  List<ChatUser> _typingUsers = <ChatUser>[];

  @override
  Widget build (BuildContext context){
    return Scaffold(
      backgroundColor: const Color(0xFFF7F4F2),
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: const Text(
          'Hiro Chatbot',
          style: TextStyle(
            color: const Color(0xFF4F3422),
            fontWeight: FontWeight.bold, 
          ),
        ),
      ),
      body: DashChat(
        currentUser: _currentUser, 
        typingUsers: _typingUsers,
        messageOptions: const MessageOptions(
          currentUserContainerColor: Colors.black,
          containerColor: Color.fromRGBO(0, 166,126, 1),
          textColor: Colors.white,
        ),
        inputOptions: InputOptions(
          inputDecoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,  // Ubah latar belakang kolom input menjadi putih
            hintText: "Write a message...",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),  // Opsional: Untuk tampilan lebih rounded
              borderSide: BorderSide.none, // Menghilangkan border luar
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12), // Menyesuaikan padding agar lebih nyaman
          ),
        ),
        onSend: (ChatMessage m){
          getChatResponse(m);
        }, 
        messages: _messages),
    );
  }
  Future<void> getChatResponse(ChatMessage m)async{
    setState((){
      _messages.insert(0, m);
      _typingUsers.add(_gptChatUser);
    });
    List <Messages> _messagesHistory = _messages.reversed.map((m){
      if (m.user == _currentUser){
        return Messages(role:Role.user, content:m.text);
      }else{
        return Messages(role: Role.assistant, content: m.text);
      }
    }).toList();
    final request = ChatCompleteText(model: Gpt4ChatModel(), messages: _messagesHistory, maxToken: 200,);
    final response = await _openAI.onChatCompletion(request: request);
    for (var element in response!.choices){
      if (element.message != null){
        setState(() {
          _messages.insert(0, ChatMessage(user: _gptChatUser, createdAt: DateTime.now(), text: element.message!.content));
        });
      }
    }
    setState(() {
      _typingUsers.remove(_gptChatUser);
    });
  }
}