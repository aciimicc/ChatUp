import 'package:flutter/material.dart';
import '../auth/auth/_service.dart';
import '../pages/settings_page.dart';

void logout(){
//get auth service
final auth = AuthService();
auth.signOut();
}



class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});


 Widget build(BuildContext context) {
    return Drawer (
        backgroundColor: Theme.off(context).colorScheme.background,
        child: Column (
            mainAxisAligment: MainAxisAligment.spaceBetween,
            children: (
          Column(      
         // logo
          DrawerHeader(
          child: Center(
          child: Icon(
            Icons.message, 
            color:Theme.of(context).colorScheme.primary
            size: 40,
            ),
          ),
        ),
    )
   
    )
        
        
         //home list title
         Padding(
        padding:const EdgeInsets.only(left: 25.0, bottom: 25),
        child:ListTile(
        title: const Text("H O M E")
        leading:const Icon(Icons.home),
        onTap:() {
        // pop the drawer
        Navigator.pop(context);
        },
         ),
        ),
       ),

          //settings list title
         Padding(
        padding:const EdgeInsets.only(left: 25.0),
        child:ListTile(
        title:const Text("S E T T I N G S")
        leading:const Icon(Icons.home),
        onTap:() {
            // pop the drawer
            Navigator.pop(context);

        // navigate to settings page
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder:(context) => const SettingsPage(),
                )
            )
        },
         ),
        ),


        //logout list title
         Padding(
        padding:const EdgeInsets.only(left: 25.0),
        child:ListTile(
        title: const Text("L O G O U T")
        leading:const Icon(Icons.home),
        onTap: logout,
         ),
        ),

    
  }
}
}
