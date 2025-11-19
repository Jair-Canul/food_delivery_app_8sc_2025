import 'package:flutter/material.dart';
import 'package:food_delivery_app_8sc_2025/service/widget_support.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.only(top: 40.0),
        child: Column(
          children: [
            Image.asset(
              "images/onboard.png",
              height: 400,
              width: MediaQuery.of(context).size.width,
            ),
            SizedBox(height: 20.0),
            Text(
              "The Fastest\nFood Delivery",
              style: AppWidget.HeadlineTextFeildStyle(),
            ),
            Text(
              "Craving something delicius? Order now and get your favorites delivered fast!",
              style: AppWidget.SimpleTextFeildStyle(),
            ),
          ],
        ),
      ),
    );
  }
}
