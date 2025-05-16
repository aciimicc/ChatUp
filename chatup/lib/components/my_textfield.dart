import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String hintText;

  const MyTextField({
    super.key
    required tis.hintText,
    });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:const EdgeInsets.symmetric(horiznotal:25.0)
        child: TextField(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).colorScheme.tertiary),
        ), // OutlineInputBorder
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
        ), // OutlineInputBorder
        fillColor:Theme.of(context).colorScheme.secondary,
        filled: true,
        hintText: hintText,
        hintStyle: TextStyle(color:Theme.of(context).colorScheme.primary),
      ), // InputDecoration
    ); // TextField
  }
}
