import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:Theme.of(context).colorScheme.background
        body: Center(
          child:Column(
            mainAxisAligment:MainAxisAligment.center,
          children:{
            Icon(
              Icons.message
              size:60,
              color: Theme.of(context).colorScheme.primary,
              ),    

          const SizeBox(height:50),
          
          Text(
            "Welcome back, you've been missed!"
            style:TextStyle(
              color:Theme.of(context).colorScheme.primary,
              fontSize:16,
            ),
            ),

            const SizedBox(height: 25),

            MyTextField(
              hintText:"Email",
              obscureText: false,
            ),

            const SizedBox(height: 10),

             MyTextField(
              hintText:"Password",
              obscureText: true,
            ),


            
            
          }
        )
    );
  }
}