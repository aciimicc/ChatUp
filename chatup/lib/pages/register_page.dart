import 'package:flutter/material.dart';

import '../components/my_button.dart';
import '../components/my_textfield.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _emailController = TextFieldController();
  final TextEditingController _pwController = TextFieldController();
  final TextEditingController _confirmPwController = TextFieldController();
  
  
  RegisterPage({super.key});

  // register method
  void register(){}

  
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
            onTap: register,
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
             Text(
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
        ),
    );
  },
},
  }
}
