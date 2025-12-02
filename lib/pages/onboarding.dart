import 'package:flutter/material.dart';
import 'package:food_delivery_app_8sc_2025/pages/bottomnav.dart';
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

      body: SingleChildScrollView(
        //el SingleChildScrollView sirve para que no truene en pantallas pequeñas
        child: Container(
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
                textAlign: TextAlign.center,
                style: AppWidget.HeadlineTextFeildStyle(),
              ),
              SizedBox(
                height: 30.0,
              ), // Aquí ya puedes poner 30 o más sin que truene
              Text(
                "Craving something delicius? \nOrder now and get your favorites\ndelivered fast!",
                textAlign: TextAlign.center,
                style: AppWidget.SimpleTextFeildStyle(),
              ),
              SizedBox(height: 30.0),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BottomNav()),
                  );
                },
                child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width / 2,
                  decoration: BoxDecoration(
                    color: Color(0xff8c592a),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      "Get Started",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
