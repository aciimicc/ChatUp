import 'package:chatup/components/my_textfield.dart';
import 'package:chatup/services/auth/auth_service.dart';
import 'package:chatup/services/chat/chat_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget{
  final String receiverEmail;
  final String receiverID;

  ChatPage({
    super.key,
    required this.receiverEmail,
    required this.receiverID,
  });

  // text controller
  final TextEditingController _messageController = TextEditingController();
  // chat and auth
  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  void sendMessage() async{
    if(_messageController.text.isNotEmpty){
      await _chatService.sendMessage(receiverID, _messageController.text);
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text(receiverEmail)),
      body: Column(
        children:[
          Expanded(
            child: _buildMessageList(),
          ),  
         // user input
         _buildUserInput(),
        ],
      ),
      );
  }

  Widget _buildMessageList(){
    String senderID = _authService.getCurrentUser()!.uid;
    return StreamBuilder(
      stream: _chatService.getMessages(receiverID, senderID),
      builder: (context, snapshot){
        if(snapshot.hasError){
          return const Text("Error");
        }
        if(snapshot.connectionState == ConnectionState.waiting){
          return const Text("Loading");
        }
        return ListView(
          children: 
              snapshot.data!.docs.map((doc) => _buildMessageItem(doc)).toList(),
          
        );
      },
    );
  }
  // build message item
  Widget _buildMessageItem(DocumentSnapshot doc){
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    //is current user
    bool isCurrentUser = data['senderID'] == _authService.getCurrentUser()!.uid;

    // align message
    var alignment =
        isCurrentUser ? Alignment.centerRight : Alignment.centerLeft;

    return Container(
      alignment: alignment,
      child: Column(
        crossAxisAlignment: 
          isCurrentUser ? CrossAxisAlignment.end: CrossAxisAlignment.start,
        children: [
          Text(data['message']),
        ],
      ),
      );
      }
  Widget _buildUserInput(){
    return Row(
      children: [

        Expanded(
          child: MyTextField(
            controller: _messageController,
            hintText: "Type a message...",
            obscureText: false,
          ),
        ),
        // sendbutton
        IconButton(
          onPressed: sendMessage,
          icon: const Icon(Icons.arrow_upward),
          ),
      ],
    );
  }

}