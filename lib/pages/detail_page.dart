import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:food_delivery_app_8sc_2025/service/constant.dart';
import 'package:food_delivery_app_8sc_2025/service/database.dart';
import 'package:food_delivery_app_8sc_2025/service/shared_pref.dart';
import 'package:food_delivery_app_8sc_2025/service/widget_support.dart';
import 'package:http/http.dart' as http;
import 'package:random_string/random_string.dart';

class DetailPage extends StatefulWidget {
  String image;
  String name;
  String price;
  DetailPage({required this.image, required this.name, required this.price});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  TextEditingController addresscontroller = new TextEditingController();
  int quantity = 1, totalprice = 0;

  // 1. DECLARAMOS LA VARIABLE GLOBAL AQUÍ
  Map<String, dynamic>? paymentIntent;
  String? name, id, email, address;

  getthesharedpref() async {
    name = await SharedpreferenceHelper().getUserName();
    id = await SharedpreferenceHelper().getUserId();
    email = await SharedpreferenceHelper().getUserEmail();
    address = await SharedpreferenceHelper().getUserAddress();
    print(name);
    print(id);
    print(email);
    setState(() {});
  }

  @override
  void initState() {
    totalprice = int.parse(widget.price);
    getthesharedpref();
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
                  "We've established that most cheeses will melt when baked atop pizza. But which will not only melt but stretch info those gooey, messy strands that can make pizza eating such a delightfully challenging endeavor?",
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

                  // 3. CONECTAMOS EL BOTÓN CON LA FUNCIÓN makePayment
                  GestureDetector(
                    onTap: () {
                      if (address == null) {
                        openBox();
                      } else {
                        makePayment(totalprice.toString());
                      }
                    },
                    child: Material(
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

  // -----------------------------------------------------------------------
  // TODAS LAS FUNCIONES DE STRIPE VAN AQUÍ ADENTRO (Antes de la última llave)
  // -----------------------------------------------------------------------

  Future<void> makePayment(String amount) async {
    try {
      paymentIntent = await createPaymentIntent(amount, 'USD');
      await Stripe.instance
          .initPaymentSheet(
            paymentSheetParameters: SetupPaymentSheetParameters(
              paymentIntentClientSecret: paymentIntent!['client_secret'],
              style: ThemeMode.dark,
              merchantDisplayName: 'Adnan',
            ),
          )
          .then((value) {});

      displayPaymentSheet(amount);
    } catch (e, s) {
      print('exception:$e$s');
    }
  }

  displayPaymentSheet(String amount) async {
    try {
      await Stripe.instance
          .presentPaymentSheet()
          .then((value) async {
            String orderId = randomAlphaNumeric(10);
            Map<String, dynamic> userOrderMap = {
              "Name": name,
              "id": id,
              "Quantity": quantity.toString(),
              "Total": totalprice.toString(),
              "Email": email,
              "FoodName": widget.name,
              "FoodImage": widget.image,
              "OrderId": orderId,
              "Status": "Pendind",
              "Address": address ?? addresscontroller.text,
            };
            await DatabaseMethods().addUserOrderDetails(
              userOrderMap,
              id!,
              orderId,
            );

            await DatabaseMethods().addAdminOrderDetails(userOrderMap, orderId);

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.green,
                content: Text(
                  "Order Placed Successfully",
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
              ),
            );

            showDialog(
              context: context, // Ahora sí reconoce el context
              builder: (_) => AlertDialog(
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.check_circle, color: Colors.green),
                        Text("Payment Successfull"),
                      ],
                    ),
                  ],
                ),
              ),
            );
            paymentIntent = null;
          })
          .onError((error, stackTrace) {
            print("Error is :---> $error $stackTrace");
          });
    } on StripeException catch (e) {
      print("Error is:--->$e");
      showDialog(
        context: context,
        builder: (_) => AlertDialog(content: Text("Cancelled")),
      );
    } catch (e) {
      print('$e');
    }
  }

  createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': calculateAmount(amount),
        'currency': currency,
        'payment_method_types[]': 'card',
      };

      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization':
              'Bearer $secretKey', // Usa la variable que declaramos arriba
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: body,
      );
      return jsonDecode(response.body);
    } catch (err) {
      print('err charging user: ${err.toString()}');
    }
  }

  // 4. AGREGUÉ ESTA FUNCIÓN QUE FALTABA
  calculateAmount(String amount) {
    final calculatedAmount = (int.parse(amount)) * 100;
    return calculatedAmount.toString();
  }

  Future openBox() => showDialog(
    context: context,
    builder: (context) => AlertDialog(
      content: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.cancel),
                  ),
                  SizedBox(
                    width: 30.0,
                  ), // Ajusté un poco el espacio para centrarlo mejor
                  Text(
                    "Add the Address",
                    style: TextStyle(
                      color: Color(0xff008080),
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ), // Un poco más grande
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              Text("Add Address"),
              SizedBox(height: 10.0),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                decoration: BoxDecoration(
                  // AQUÍ CORREGÍ EL GROSOR: de 10.0 a 1.0
                  border: Border.all(color: Colors.black38, width: 1.0),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: addresscontroller,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Address",
                  ),
                ),
              ),
              SizedBox(height: 20.0),

              GestureDetector(
                onTap: () async {
                  await SharedpreferenceHelper().saveUserAddress(
                    addresscontroller.text,
                  );
                  Navigator.pop(context); // Cierra el diálogo
                },
                child: Center(
                  child: Container(
                    width: 100, // Un ancho fijo para que se vea como botón
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Color(0xff008080), // El color verde azulado
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "Add",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
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
    ),
  );
} // <--- AQUÍ TERMINA LA CLASE _DetailPageState
