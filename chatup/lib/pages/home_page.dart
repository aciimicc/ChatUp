import 'package:chatup/components/user_tile.dart';
import 'package:chatup/pages/chat_page.dart';
import 'package:chatup/services/auth/auth_service.dart';
import 'package:chatup/services/chat/chat_service.dart';
import 'package:flutter/material.dart';
import '../components/my_drawer.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  // chat and auth service
  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();


/*void logout(){
  final auth= AuthService();
  auth.signOut();
}*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey,
        elevation: 0,
      ), // AppBar
      drawer: const MyDrawer(),
      body: _buildUserList(),
    ); // Scaffold
  }

  // build a list of users except for the current logged in user
  Widget _buildUserList(){
    return StreamBuilder(
      stream: _chatService.getUsersStream(),
      builder: (context, snapshot){
        // error
        if (snapshot.hasError){
          return const Text("Error");
        }
        // loading..
        if(snapshot.connectionState == ConnectionState.waiting){
          return const Text("Loading...");
        }

        // return list view
        return ListView(
          children: snapshot.data!.map<Widget>((userData) => _buildUserListItem(userData, context)).toList(),
        );
      },
    );
  }
  Widget _buildUserListItem(
    Map<String, dynamic> userData, BuildContext context){
    if(userData["email"] != _authService.getCurrentUser()!.email) { // display all users except current user
      return UserTile(
        text: userData["email"],
        onTap:(){
          // tapped on a user -> go to chat page
          Navigator.push(context,MaterialPageRoute(builder: (context) => ChatPage(
            receiverEmail: userData["email"],
            receiverID: userData["uid"],
          ),
          )
        );
        },
      );
    } else{
      return Container();
    }
    }
}
