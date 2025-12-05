import 'package:flutter/material.dart';
import 'package:food_delivery_app_8sc_2025/Admin/all_order.dart';
import 'package:food_delivery_app_8sc_2025/Admin/manage_users.dart';
import 'package:food_delivery_app_8sc_2025/pages/onboarding.dart';
import 'package:food_delivery_app_8sc_2025/service/widget_support.dart';

class HomeAdmin extends StatefulWidget {
  const HomeAdmin({super.key});

  @override
  State<HomeAdmin> createState() => _HomeAdminState();
}

class _HomeAdminState extends State<HomeAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 60.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Home Admin", style: AppWidget.HeadlineTextFeildStyle()),
                ],
              ),
            ),
            SizedBox(height: 40.0),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xFFececf8),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 80.0),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AllOrders()),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 20.0, right: 20.0),
                        child: Material(
                          elevation: 3.0,
                          borderRadius: BorderRadius.circular(30),
                          child: Container(
                            padding: EdgeInsets.only(
                              left: 20.0,
                              right: 20.0,
                              top: 10.0,
                              bottom: 10.0,
                            ),

                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(
                                  "images/delivery-man.png",
                                  height: 120,
                                  width: 120,
                                  fit: BoxFit.cover,
                                ),
                                Text(
                                  "Manage\nOrders",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    color: Color(0xffef2b39),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.white,
                                    size: 30.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 50.0),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ManageUsers(),
                          ),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 20.0, right: 20.0),
                        child: Material(
                          elevation: 3.0,
                          borderRadius: BorderRadius.circular(30),
                          child: Container(
                            padding: EdgeInsets.only(
                              left: 20.0,
                              right: 20.0,
                              top: 10.0,
                              bottom: 10.0,
                            ),

                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(
                                  "images/team.png",
                                  height: 120,
                                  width: 120,
                                  fit: BoxFit.cover,
                                ),
                                Text(
                                  "Manage\nUsers",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    color: Color(0xffef2b39),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.white,
                                    size: 30.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 60.0),

                    /// -------- LOG OUT ----------
                    GestureDetector(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Onboarding(),
                          ),
                          (route) => false,
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.only(left: 60.0, right: 60.0),
                        child: Material(
                          elevation: 3.0,
                          borderRadius: BorderRadius.circular(30),
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: const Center(
                              child: Text(
                                "Log Out",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

////Inicia en 5:21:36
