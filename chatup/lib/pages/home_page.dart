import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});


  @override
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
        
        
         //home list title
         Padding(
        padding:const EdgeInsets.only(left: 25.0, bottom: 25),
        child:ListTile(
        title: Text("H O M E")
        leading:Icon(Icons.home),
        onTap:() {},
         ),
        ),
       ),

          //settings list title
         Padding(
        padding:const EdgeInsets.only(left: 25.0),
        child:ListTile(
        title: Text("S E T T I N G S")
        leading:Icon(Icons.home),
        onTap:() {},
         ),
        ),


        //logout list title
         Padding(
        padding:const EdgeInsets.only(left: 25.0),
        child:ListTile(
        title: Text("L O G O U T")
        leading:Icon(Icons.home),
        onTap:() {},
         ),
        ),

    
  }
}
