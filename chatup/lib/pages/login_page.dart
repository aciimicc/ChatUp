import 'package:chatup/components/my_button.dart';
import 'package:chatup/components/my_textfield.dart';
import 'package:chatup/services/auth/auth_service.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {


  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  
//tap to go to register page
final void Function ()? onTap;


  LoginPage({super.key, required this.onTap});

  void login(BuildContext context) async { 
  // auth service
  final authService= AuthService();

  //try login
  try{
    await authService.signInWithEmailPassword(_emailController.text, _pwController.text);
  }
  // catch any errors
  catch (e){
   showDialog(
    context: context,
    builder: (context)=> AlertDialog(
    title:Text(e.toString()),
    ),
  );

  }

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
            onTap: ()=> login (context),
           )
            
            const SizedBox(height: 25), 

            //register now
            Row(
              mainAxisAligment: MainAxisAligment.center,
              children: [
             Text(
              "Not a member? ",
              style:TextStle(color: Theme.of(context).colorScheme.primary),
              ),
             GestureDetector(
              onTap: onTap,
              child:
              "Register now ",
              style:TextStyle(
                fonWeight:FontWeight.bold,
              style:TextStle(color: Theme.of(context).colorScheme.primary),
             ),
             ),
            ],
            ),
          },
        ),
    );
  },
},