import 'package:flutter/material.dart';

///import 'package:food_delivery_app_8sc_2025/pages/home.dart';
import 'package:food_delivery_app_8sc_2025/service/widget_support.dart';

class DetailPage extends StatefulWidget {
  String image;
  String name;
  String price;
  DetailPage({required this.image, required this.name, required this.price});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int quantity = 1, totalprice = 0;

  @override
  void initState() {
    totalprice = int.parse(widget.price);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 50.0, left: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  // Esto "empuja" la página Home encima de la actual
                  Navigator.pop(context);
                },
                child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Color(0xffef2b39),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Icon(
                    Icons.arrow_back,
                    size: 30.0,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Center(
                child: Image.asset(
                  widget.image,

                  /// Esto es para usar la imagen pasada como parámetro
                  height: MediaQuery.of(context).size.height / 3,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 20.0),
              Text(widget.name, style: AppWidget.HeadlineTextFeildStyle()),
              Text("\$" + widget.price, style: AppWidget.priceTextFeildStyle()),
              SizedBox(height: 30.0),
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Text(
                  "We've established that most cheeses will melt when baked atop pizza. But which will not only melt but stretch into those gooey, messy strands that can make pizza eating such a delightfully challenging endeavor?",
                  style: AppWidget.SimpleTextFeildStyle(),
                ),
              ),
              SizedBox(height: 30.0),
              Text("Quantity", style: AppWidget.SimpleTextFeildStyle()),
              SizedBox(height: 10.0),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      quantity = quantity + 1;
                      totalprice = totalprice + int.parse(widget.price);
                      setState(() {});
                    },
                    child: Material(
                      elevation: 3.0,
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Color(0xffef2b39),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(Icons.add, color: Colors.white, size: 30),
                      ),
                    ),
                  ),
                  SizedBox(width: 20.0),
                  Text(
                    quantity.toString(),
                    style: AppWidget.HeadlineTextFeildStyle(),
                  ),
                  SizedBox(width: 20.0),
                  GestureDetector(
                    onTap: () {
                      if (quantity > 1) {
                        quantity = quantity - 1;
                        totalprice = totalprice - int.parse(widget.price);
                        setState(() {});
                      }
                    },
                    child: Material(
                      elevation: 3.0,
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Color(0xffef2b39),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(
                          Icons.remove,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20.0),
                ],
              ),
              SizedBox(height: 40.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Material(
                    elevation: 3.0,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: 60,
                      width: 120,
                      decoration: BoxDecoration(
                        color: Color(0xffef2b39),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          "\$" + totalprice.toString(),
                          style: AppWidget.boldwhiteTextFeildStyle(),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 30.0),
                  Material(
                    elevation: 3.0,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: 70,
                      width: 200,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          "ORDER NOW",
                          style: AppWidget.whiteTextFeildStyle(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}
