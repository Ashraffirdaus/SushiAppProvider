import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sushi_apps/components/my_button.dart';
import 'package:sushi_apps/const/color.dart';
import 'package:sushi_apps/models/food.dart';
import 'package:sushi_apps/models/shop.dart';

class FoodDetailsPage extends StatefulWidget {
  final Food food;
  const FoodDetailsPage({super.key, required this.food});

  @override
  State<FoodDetailsPage> createState() => _FoodDetailsPageState();
}

class _FoodDetailsPageState extends State<FoodDetailsPage> {
  //variable  quantity
  int quantityCount = 0;

  //decrement quantity
  void decrementQuantity() {
    setState(() {
      quantityCount--;
    });
  }

  //increament quantity
  void increamentQuantity() {
    setState(() {
      quantityCount++;
    });
  }

  //add to cart
  void addToCart() {
    //only add to cart if there is something in the cart
    if (quantityCount > 0) {
      //get access to shop
      final shop = context.read<Shop>();

      //add to cart
      shop.addToCart(widget.food, quantityCount);

      // let the user know  if its succesful]
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: ((context) => AlertDialog(
              content: const Text("Successfully added to cart"),
              actions: [
                //okay button
                IconButton(
                  onPressed: () {
                    //pop once to remove dialog
                    Navigator.pop(context);

                    //pop again to previous screen
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.done),
                ),
              ],
            )),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.grey[700],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Listview of food menu
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView(
                children: [
                  //image
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Image.asset(
                          widget.food.imagepath,
                          height: 150,
                        ),
                      ),
                      //price and rating
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.yellow[800],
                          ),
                          Text(
                            widget.food.rating,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      //name of the food
                      Text(
                        widget.food.name,
                        style: GoogleFonts.dmSerifDisplay(fontSize: 20),
                      ),
                      const SizedBox(
                        height: 5,
                      ),

                      const SizedBox(
                        height: 5,
                      ),
                      //Description
                      Text(
                        "Description",
                        style: GoogleFonts.dmSerifDisplay(fontSize: 20),
                      ),
                      const Text(
                        "Sushi sashimi is a traditional Japanese dish that consists of thinly sliced, fresh raw fish or seafood. It is often served as an appetizer or as part of a sushi platter, alongside other sushi varieties like nigiri and maki.",
                        style: TextStyle(
                          height: 2,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 40),
            decoration: BoxDecoration(color: primaryColor),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //Price + Quantity
                    Text(
                      '\$${widget.food.price}',
                      style: const TextStyle(color: Colors.white, fontSize: 30),
                    ),
                    //button Add to cart
                    Row(
                      children: [
                        //minus button
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[600], shape: BoxShape.circle),
                          child: IconButton(
                            onPressed: decrementQuantity,
                            icon: const Icon(
                              Icons.remove,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        SizedBox(
                          child: Center(
                            child: Text(
                              quantityCount.toString(),
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 30),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[600], shape: BoxShape.circle),
                          child: IconButton(
                            onPressed: increamentQuantity,
                            icon: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                //add to cart button
                MyButton(
                  getText: "Add to Cart",
                  onTap: addToCart,
                  paddingButton: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
