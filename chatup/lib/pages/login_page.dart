import 'package:chatapptute/components/my_textfield.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {


  final TextEditingController _emailController = TextFieldController();
  final TextEditingController _pwController = TextFieldController();
  
  LoginPage({super.key});

  void login(){

  }

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
              controller: _emailController,
            ),

            const SizedBox(height: 10),

             MyTextField(
              hintText:"Password",
              obscureText: true,
              controller: _pwController,
            ), 

            
           const SizedBox(height: 25), 

           //login button
           MyButton(
            text:"Login",
            onTap: login,
           )
            
            const SizedBox(height: 25), 

            //register now
            Row(
              mainAxisAligment: MainAxisAligment.center,
              children: [
             Text(
              "Not a member? ",
              ),
             Text(
              "Register now ",
              style:TextStyle(
                fonWeight:FontWeight.bold,
             ),
             ),
            ],
            ),
          },
        ),
    );
  },
},