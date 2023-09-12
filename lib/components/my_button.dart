// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:sushi_apps/const/color.dart';

class MyButton extends StatelessWidget {
  final String getText;
  final EdgeInsetsGeometry paddingButton;
  void Function()? onTap;
  MyButton({super.key, required this.getText, required this.onTap,required this.paddingButton});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: paddingButton,
        child: Container(
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: buttonBackgroundColor
          ),
          child: 
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    getText,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                 const  SizedBox(
                    width: 10,
                  ),
                  const Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
                ],
              ),
              
            
          
        ),
      ),
    );
  }
}
