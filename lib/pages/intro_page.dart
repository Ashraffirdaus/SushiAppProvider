import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushi_apps/components/my_button.dart';
import 'package:sushi_apps/const/color.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: scaffoldBackgroundColor,
        body: // shop name
            Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(
                height: 25,
              ),
              Text(
                "Sushi Man",
                style: GoogleFonts.dmSerifDisplay(
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
              //Icon
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: Image.asset(
                  "lib/images/salmon.png",
                ),
              ),
              //title
              Text(
                "THE TASTE OF JAPENESE FOOD",
                style: GoogleFonts.dmSerifDisplay(
                  fontSize: 44,
                  color: Colors.white,
                ),
              ),
              //subtitle
              Text(
                "Feel the taste of the most popular Japenese food from anywhere and anytime",
                style: GoogleFonts.dmSerifDisplay(
                  color: Colors.grey[300],
                  height: 2,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // get started button,
              MyButton(
                getText: "Get Started",
                paddingButton: const EdgeInsets.all(8.0),
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/menupage',
                  );
                  
                },
              ),
            ],
          ),
        ));
  }
}
