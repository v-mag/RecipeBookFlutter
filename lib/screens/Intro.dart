import 'package:flutter/material.dart';
import 'package:recipebook/main.dart';
import 'package:carousel_slider/carousel_slider.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  CarouselController btnCarouselCtrl = CarouselController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              enableInfiniteScroll: false,
              reverse: true,
            ),
            items: [
              Container(child: Text("Bienvenue dans votre application de recette")),
              Column(
                children: [
                  Text("Pour commencer entrer un nom d'utilisateur"),
                  TextField()
                ],
              ),
              Text("Et votre mot de passe"),
            ],
            carouselController: btnCarouselCtrl,
          ),
          ElevatedButton(
            onPressed: () => btnCarouselCtrl.nextPage(
            duration: Duration(milliseconds: 200), curve: Curves.linear),
            child: Text('→'),
          ),
        ],
      ),
    );
  }
}
