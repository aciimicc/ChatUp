import 'package:chatup/themes/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatBubble extends StatelessWidget{
  final String message;
  final bool isCurrentUser;

  const ChatBubble({
    super.key,
    required this.message,
    required this.isCurrentUser,
  });
  @override
  Widget build(BuildContext context){
    bool isDarkMode = 
      Provider.of<ThemeProvider>(context, listen: false).isDarkMode;
    return Container(
      decoration: BoxDecoration(
        color:isCurrentUser 
        ? (isDarkMode ? Colors.lightGreen.shade800 : Colors.lightGreen)
        :(isDarkMode ? Colors.blueGrey.shade800 : Colors.blueGrey.shade200),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical:2.5, horizontal: 25),
      child: Text(
        message,
        style: TextStyle(color:Colors.white)
        ),
    );
  }
  
}