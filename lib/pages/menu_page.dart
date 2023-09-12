import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sushi_apps/components/food_tile.dart';
import 'package:sushi_apps/components/my_button.dart';
import 'package:sushi_apps/components/my_text_field.dart';
import 'package:sushi_apps/const/color.dart';import 'package:sushi_apps/models/shop.dart';
import 'package:sushi_apps/pages/food_details_page.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({
    super.key,
  });

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  final promoController = TextEditingController();

  void navigateFoodDetailPage(int index) {
    //get the shop and its menu
    final shop = context.read<Shop>();
    final foodMenu =shop.foodMenu;
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: ((context) => FoodDetailsPage(
              food: foodMenu[index],
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
     //get the shop and its menu
    final shop = context.read<Shop>();
    final foodMenu =shop.foodMenu;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(
          Icons.menu,
          color: Colors.black,
        ),
        actions: [
          //cart button
          IconButton(onPressed: (){
            Navigator.pushNamed(context, '/cartpage');
          }, icon: const Icon(Icons.shopping_bag),color: Colors.black,)
        ],
        title: const Text(
          "Tokyo",
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        //Promo Banner
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 40),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0), color: primaryColor),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Get 32% Promo",
                        style: GoogleFonts.dmSerifDisplay(
                            color: Colors.white, fontSize: 20)),
                    const SizedBox(
                      height: 20,
                    ),
                    MyButton(
                      getText: "Redeem",
                      onTap: () {},
                      paddingButton: const EdgeInsets.all(8.0),
                    )
                  ],
                ),
                Image.asset(
                  'lib/images/salmon.png',
                  height: 100,
                )
              ],
            ),
          ),

          //Search Bar
        ),
        const SizedBox(
          height: 25,
        ),
        MyTextField(
          hintText: "Search here...",
          controller: promoController,
        ),
        const SizedBox(
          height: 10,
        ),
        //Menu list
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Text(
            "Food Menu",
            style: TextStyle(
                fontSize: 15,
                color: Colors.grey[800],
                fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        //Popular Food
        Expanded(
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: foodMenu.length,
              itemBuilder: (context, index) {
                return FoodTile(
                  food: foodMenu[index],
                  onTap: () => navigateFoodDetailPage(index),
                );
              }),
        ),
        Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(20.0)),
          margin:
              const EdgeInsets.only(left: 30, right: 30, bottom: 30, top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                'lib/images/salmon.png',
                height: 100,
              ),
              const SizedBox(
                width: 0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Popular food name
                  Text(
                    "Sasimi Salmon",
                    style: GoogleFonts.dmSerifDisplay(fontSize: 20),
                  ),
                  // food price
                  const Text("\$ 10")
                ],
              ),
              const Icon(
                Icons.favorite_border_outlined,
                size: 40,
              )
            ],
          ),
        )
      ]),
    );
  }
}
