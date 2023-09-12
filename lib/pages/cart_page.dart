import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushi_apps/const/color.dart';
import 'package:sushi_apps/models/food.dart';
import 'package:sushi_apps/models/shop.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(builder: ((context, value, child) => Scaffold(
      appBar: AppBar(
        title: const Text("Cart Page"),
        backgroundColor: primaryColor,
      ),
      body: ListView.builder(
        itemCount: value.cart.length,
        itemBuilder: ((context, index) {
        //get food from cart
      final Food food = value.cart[index];
        // get food name
      final String foodName = food.name;
        // get food price
        final String foodPrice = food.price;
        //return Listtile
        return  ListTile(
          title: Text(foodName),
          subtitle: Text(foodPrice),
        );
        
      })),
    )));
  }
}