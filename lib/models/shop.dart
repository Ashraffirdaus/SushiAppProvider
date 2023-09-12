// ignore_for_file: recursive_getters

import 'package:flutter/material.dart';
import 'package:sushi_apps/models/food.dart';

class Shop extends ChangeNotifier {
  //List foodMenu

  final List<Food> _foodMenu = [
    //salmon
    Food(
      name: "Salmon Sasimi",
      imagepath: "lib/images/salmon.png",
      price: "10 ",
      rating: "4.5",
    ),
    //Sushi
    Food(
      name: "Sushi Square",
      imagepath: "lib/images/sushisquare.png",
      price: "10 ",
      rating: "4.2",
    ),
    Food(
      name: "Sushi Sasimi",
      imagepath: "lib/images/sasimi.png",
      price: "50 ",
      rating: "4.2",
    ),
  ];

  //customer cart
  final List<Food> _cart = [];

  //getter methods
  List<Food> get foodMenu => _foodMenu;
  List<Food> get cart => _cart;

  //add to cart
  void addToCart(Food foodItem, int quantity) {
    for (int i = 0; i < quantity; i++) {
      _cart.add(foodItem);
      notifyListeners();
    }
  }
  //removing from the cart

  void removeCart(Food food) {
    _cart.remove(food);
    notifyListeners();
  }
}
