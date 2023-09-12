// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushi_apps/models/food.dart';

class FoodTile extends StatelessWidget {
  final Food food;
  void Function()? onTap;
  FoodTile({super.key, required this.food, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //image
              Image.asset(
                food.imagepath,
                height: 140,
              ),
              //Text
              Text(
                food.name,
                style: GoogleFonts.dmSerifDisplay(fontSize: 20),
              ),
              //price and rating
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('\$${food.price}',style: const TextStyle(fontSize: 20),),
                  Text(
                    food.rating,
                    style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.yellow[800],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
