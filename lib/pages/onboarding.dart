import 'package:flutter/material.dart';
import 'package:food_delivery_app_8sc_2025/Admin/admin_login.dart';
import 'package:food_delivery_app_8sc_2025/pages/bottomnav.dart';
import 'package:food_delivery_app_8sc_2025/pages/signup.dart';
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
            Image.asset("images/onboard.png"),
            SizedBox(height: 20.0),
            Text(
              "The Fastest\nFood Delivery",
              textAlign: TextAlign.center,
              style: AppWidget.HeadlineTextFeildStyle(),
            ),
            SizedBox(height: 20.0),
            Text(
              "Craving something delicious?\nOrder now and get your favorites\ndelivered fast!",
              textAlign: TextAlign.center,
              style: AppWidget.SimpleTextFeildStyle(),
            ),
            SizedBox(height: 30.0),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUp()),
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
            SizedBox(height: 20),

            /// ---------- GET ADMIN ----------
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AdminLogIn()),
                );
              },
              child: Container(
                height: 60,
                width: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Center(
                  child: Text(
                    "Get Admin",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
