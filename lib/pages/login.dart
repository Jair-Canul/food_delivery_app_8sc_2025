import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app_8sc_2025/pages/bottomnav.dart';
import 'package:food_delivery_app_8sc_2025/pages/signup.dart';
import 'package:food_delivery_app_8sc_2025/service/widget_support.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  String email = "", password = "", name = "";
  TextEditingController namecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController mailcontroller = TextEditingController();

  bool _isObscure = false;

  userLogin() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email!,
        password: password!,
      );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => BottomNav()),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "No user Found for that Email",
              style: TextStyle(fontSize: 18.0, color: Colors.black),
            ),
          ),
        );
      } else if (e.code == 'wrong-passwrod') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "Wrong Password Provided by User",
              style: TextStyle(fontSize: 18.0, color: Colors.black),
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          // Agregamos un padding final al SingleChildScrollView para que el contenido no quede pegado al borde y dé espacio para el scroll
          padding: EdgeInsets.only(bottom: 50.0),
          child: Stack(
            children: [
              // ----------------------------------------------------
              // CONTENEDOR AMARILLO SUPERIOR (Header)
              // ----------------------------------------------------
              Container(
                height: screenHeight / 2.5, // Mantenemos la proporción
                padding: EdgeInsets.only(top: 30),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xffffefbf),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                ),
                child: Column(
                  children: [
                    Image.asset(
                      "images/pan.png",
                      height: 120,
                      fit: BoxFit.fill,
                      width: 180,
                    ),
                    Image.asset(
                      "images/logo.png",
                      width: 150,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),

              // ----------------------------------------------------
              // TARJETA BLANCA (Formulario)
              // ----------------------------------------------------
              Container(
                margin: EdgeInsets.only(
                  // AJUSTE CRÍTICO: Reducimos el margen superior para que la tarjeta suba un poco
                  // screenHeight / 2.5 es 0.40. Usaremos 0.38 para un leve solapamiento más alto.
                  top: screenHeight * 0.32,
                  left: 20.0,
                  right: 20.0,
                ),
                child: Material(
                  elevation: 3.0,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: EdgeInsets.only(left: 20.0, right: 20.0),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    // ELIMINAMOS LA ALTURA FIJA:
                    // height: MediaQuery.of(context).size.height / 1.8, <--- ELIMINADO
                    child: Column(
                      // IMPORTANTE: Permite que el Column use el mínimo espacio vertical necesario
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20),
                        Center(
                          child: Text(
                            "LogIn",
                            style: AppWidget.HeadlineTextFeildStyle(),
                          ),
                        ),
                        SizedBox(height: 10.0),

                        // Campos de Texto (Name, Email, Password)
                        SizedBox(height: 20.0),
                        Text("Email", style: AppWidget.SignUpTextFeildStyle()),
                        SizedBox(height: 5.0),
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFececf8),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextField(
                            controller: mailcontroller,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Enter Email",
                              prefixIcon: Icon(Icons.mail_outline),
                            ),
                          ),
                        ),

                        SizedBox(height: 20.0),
                        Text(
                          "Password",
                          style: AppWidget.SignUpTextFeildStyle(),
                        ),
                        SizedBox(height: 5.0),
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFececf8),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextField(
                            obscureText: _isObscure,
                            controller: passwordcontroller,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Enter Password",
                              prefixIcon: Icon(Icons.password_outlined),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _isObscure
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isObscure = !_isObscure;
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "Forgot Password?",
                              style: AppWidget.SimpleTextFeildStyle(),
                            ),
                          ],
                        ),
                        SizedBox(height: 40.0),
                        // Botón Sign Up
                        GestureDetector(
                          onTap: () {
                            if (mailcontroller.text != "" &&
                                passwordcontroller.text != "") {
                              setState(() {
                                email = mailcontroller.text;
                                password = passwordcontroller.text;
                              });
                              userLogin();
                            }
                          },
                          child: Center(
                            child: Container(
                              width: 200,
                              height: 60,
                              decoration: BoxDecoration(
                                color: Color(0xffef2b39),
                                borderRadius: BorderRadius.circular(
                                  10,
                                ), // Agregamos bordes redondeados
                              ),
                              child: Center(
                                child: Text(
                                  "Log In",
                                  style: AppWidget.whiteTextFeildStyle(),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an account? ",
                              style: AppWidget.SimpleTextFeildStyle(),
                            ),
                            SizedBox(width: 10.0),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SignUp(),
                                  ),
                                );
                              },
                              child: Text(
                                "SignUp",
                                style: AppWidget.boldTextFeildStyle(),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.0,
                        ), // Espacio final dentro de la tarjeta
                      ],
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
