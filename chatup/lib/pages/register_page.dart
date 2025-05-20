import 'package:flutter/material.dart';

import '../components/my_button.dart';
import '../components/my_textfield.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _emailController = TextFieldController();
  final TextEditingController _pwController = TextFieldController();
  final TextEditingController _confirmPwController = TextFieldController();
  
  
  //tap to go to register page
  final void Function()?;
  
  RegisterPage({super.key, required this.onTap});

 // register method
void register(BuildContext context) {
  // get auth service
  final _auth = AuthService();

  // passwords match -> create user 
  if (_pwController.text == _confirmPwController.text) {
    try {
      _auth.signUpWithEmailPassword(
        _emailController.text,
        _pwController.text,
      );
    } catch (e) {
      // handle error
    } showDialog(
    context: context,
    bulider: (context)=> AlertDialog(
    title:Text(e.toString()),
    ), // AlertDialog
  );
  }
}
}
// passwords dont match -> tell user to fix
else {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Passwords dont match!"),
      ), // AlertDialog
    );
  }
 // passwords dont match -> tell user to fix
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
            "Lets create an account for u",
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
              hintText:"Confirm Password",
              obscureText: true,
              controller: _confirmPwController,
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
            text:"Register",
            onTap:()=> register(context),
           )
            
            const SizedBox(height: 25), 

            //register now
            Row(
              mainAxisAligment: MainAxisAligment.center,
              children: [
             Text(
              "Already have an account?",
              style:TextStle(color: Theme.of(context).colorScheme.primary),
              ),
             GestureDetector(
                onTap: onTap,
                child:
              "Login now ",
              style:TextStyle(
                fonWeight:FontWeight.bold,
              style:TextStle(color: Theme.of(context).colorScheme.primary),
             ),
             ),
            ],
            ),
           ),
          },
        
