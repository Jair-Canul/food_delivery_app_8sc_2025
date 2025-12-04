import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:food_delivery_app_8sc_2025/service/constant.dart';
import 'package:food_delivery_app_8sc_2025/service/database.dart';
import 'package:food_delivery_app_8sc_2025/service/shared_pref.dart';
import 'package:food_delivery_app_8sc_2025/service/widget_support.dart';
import 'package:http/http.dart' as http;

class Wallet extends StatefulWidget {
  const Wallet({super.key});

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  TextEditingController amountcontroller = new TextEditingController();
  Map<String, dynamic>? paymentIntent;

  String? email, wallet, id;

  getthesharedpref() async {
    email = await SharedpreferenceHelper().getUserEmail();
    id = await SharedpreferenceHelper().getUserId();
    setState(() {});
  }

  getUserWallet() async {
    await getthesharedpref();
    QuerySnapshot querySnapshot = await DatabaseMethods().getUserWalletbyemail(
      email!,
    );
    wallet = "${querySnapshot.docs[0]["Wallet"]}";
    print(wallet);
    setState(() {});
  }

  @override
  void initState() {
    getUserWallet();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: wallet == null
          ? Center(child: CircularProgressIndicator())
          : Container(
              margin: EdgeInsets.only(top: 40.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Wallet", style: AppWidget.HeadlineTextFeildStyle()),
                    ],
                  ),
                  SizedBox(height: 10.0),
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
                          SizedBox(height: 20.0),
                          Container(
                            margin: EdgeInsets.only(left: 20.0, right: 20.0),
                            child: Material(
                              elevation: 3.0,
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                padding: EdgeInsets.all(20),
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      "images/wallet.png",
                                      height: 80,
                                      width: 80,
                                      fit: BoxFit.cover,
                                    ),
                                    SizedBox(width: 20.0),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Your Wallet",
                                          style: AppWidget.boldTextFeildStyle(),
                                        ),
                                        Text(
                                          "\$" + wallet!,
                                          style:
                                              AppWidget.HeadlineTextFeildStyle(),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 40.0),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment
                                  .spaceEvenly, ////////04:06:02
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    makePayment("100");
                                  },
                                  child: Container(
                                    height: 50,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                        color: Colors.black45,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "\$100",
                                        style: AppWidget.priceTextFeildStyle(),
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    makePayment("50");
                                  },
                                  child: Container(
                                    height: 50,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                        color: Colors.black45,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "\$50",
                                        style: AppWidget.priceTextFeildStyle(),
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    makePayment("200");
                                  },
                                  child: Container(
                                    height: 50,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                        color: Colors.black45,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "\$200",
                                        style: AppWidget.priceTextFeildStyle(),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 30.0),
                          GestureDetector(
                            onTap: () {
                              openBox();
                            },
                            child: Container(
                              height: 50,
                              margin: EdgeInsets.only(left: 20.0, right: 20.0),
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: Color(0xffef2b39),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  "Add Money",
                                  style: AppWidget.boldwhiteTextFeildStyle(),
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
            int updatewallet = int.parse(wallet!) + int.parse(amount);
            await DatabaseMethods().updateUserWallet(
              updatewallet.toString(),
              id!,
            );
            await getUserWallet();
            setState(() {});
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
            // Cerrar automáticamente después de 5 segundos
            Future.delayed(Duration(seconds: 5), () {
              if (Navigator.canPop(context)) {
                Navigator.of(context).pop();
              }
            });
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
                    "Add amount",
                    style: TextStyle(
                      color: Color(0xff008080),
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ), // Un poco más grande
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              Text("Enter Amount"),
              SizedBox(height: 10.0),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                decoration: BoxDecoration(
                  // AQUÍ CORREGÍ EL GROSOR: de 10.0 a 1.0
                  border: Border.all(color: Colors.black38, width: 1.0),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: amountcontroller,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Amount",
                  ),
                ),
              ),
              SizedBox(height: 20.0),

              GestureDetector(
                onTap: () async {
                  Navigator.pop(context);
                  makePayment(amountcontroller.text);
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
}
