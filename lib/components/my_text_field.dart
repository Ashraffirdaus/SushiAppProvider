import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  const MyTextField({super.key, required this.controller,required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            8.0,
          ),
        ),
        child:  SingleChildScrollView(
          child: TextField(
            controller: controller,
            decoration:  InputDecoration(
              hintText: hintText,
              contentPadding:const  EdgeInsets.symmetric(horizontal: 10)
              
          ),
              ),
        ),
    ));
  }
}
