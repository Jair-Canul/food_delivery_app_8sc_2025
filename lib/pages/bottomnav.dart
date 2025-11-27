import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:food_delivery_app_8sc_2025/pages/home.dart';
import 'package:food_delivery_app_8sc_2025/pages/order.dart';
import 'package:food_delivery_app_8sc_2025/pages/profile.dart';
import 'package:food_delivery_app_8sc_2025/pages/wallet.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  late List<Widget> pages;

  late Home HomePage;
  late Order order;
  late Wallet wallet;
  late Profile profilePage;

  int currentTabIndex = 0;

  @override
  void initState() {
    HomePage = Home();
    order = Order();
    wallet = Wallet();
    profilePage = Profile();

    pages = [HomePage, order, wallet, profilePage];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height: 70,
        backgroundColor: Colors.white,
        color: Colors.black,
        animationDuration: Duration(milliseconds: 500),
        onTap: (int index) {
          setState(() {
            currentTabIndex = index;
          });
        },
        items: [
          Icon(Icons.home, color: Colors.white, size: 30.0),
          Icon(Icons.shopping_bag, color: Colors.white, size: 30.0),
          Icon(Icons.wallet, color: Colors.white, size: 30.0),
          Icon(Icons.person, color: Colors.white, size: 30.0),
        ],
      ),
      body: pages[currentTabIndex],
    );
  }
}
