import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app_8sc_2025/pages/bottomnav.dart';
import 'package:food_delivery_app_8sc_2025/pages/login.dart';
import 'package:food_delivery_app_8sc_2025/service/database.dart';
import 'package:food_delivery_app_8sc_2025/service/shared_pref.dart';
import 'package:food_delivery_app_8sc_2025/service/widget_support.dart';
import 'package:random_string/random_string.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String email = "", password = "", name = "";
  TextEditingController namecontroller = new TextEditingController();
  TextEditingController passwordcontroller = new TextEditingController();
  TextEditingController mailcontroller = new TextEditingController();

  ///Variable para controlar el ojo de la contraseña
  bool _isObscure = true;

  registration() async {
    if (password != null &&
        namecontroller.text != "" &&
        namecontroller.text != "") {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        String Id = randomAlphaNumeric(10);

        Map<String, dynamic> UserInfoMap = {
          "Name": namecontroller.text,
          "Email": mailcontroller.text,
          "Id": Id,
          "Wallet": "0",
        };

        await SharedpreferenceHelper().saveUserEmail(email);
        await SharedpreferenceHelper().saveUserName(namecontroller.text);
        await SharedpreferenceHelper().saveUserId(Id);
        await DatabaseMethods().addUserDetails(UserInfoMap, Id);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.green,
            content: Text(
              "Registered Successfully",
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
          ),
        );
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BottomNav()),
        );

        ///Sirve para guardar en la base de datoos
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text(
                "Password provided is too weak.",
                style: TextStyle(fontSize: 16.0),
              ),
            ),
          );
        } else if (e.code == 'email-already-in-use') {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text(
                "Account Already exists",
                style: TextStyle(fontSize: 16.0),
              ),
            ),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        // Este Container no necesita 'child:'
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
                            "SignUp",
                            style: AppWidget.HeadlineTextFeildStyle(),
                          ),
                        ),
                        SizedBox(height: 30.0),
                        // Campos de Texto (Name, Email, Password)
                        Text("Name", style: AppWidget.SignUpTextFeildStyle()),
                        SizedBox(height: 5.0),
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFececf8),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextField(
                            controller: namecontroller,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Enter Name",
                              prefixIcon: Icon(Icons.person_outline),
                            ),
                          ),
                        ),

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

                        SizedBox(height: 30.0),

                        // Botón Sign Up
                        GestureDetector(
                          onTap: () {
                            if (namecontroller.text != "" &&
                                mailcontroller.text != "" &&
                                passwordcontroller.text != "") {
                              setState(() {
                                name = namecontroller.text;
                                email = mailcontroller.text;
                                password = passwordcontroller.text;
                              });
                              registration();
                            }
                          },
                          child: Center(
                            child: Container(
                              width: 200,
                              // AJUSTE FINAL: Reducimos la altura del botón (80 es mucho) y le damos borde
                              height: 50,
                              decoration: BoxDecoration(
                                color: Color(0xffef2b39),
                                borderRadius: BorderRadius.circular(
                                  10,
                                ), // Agregamos bordes redondeados
                              ),
                              child: Center(
                                child: Text(
                                  "Sign Up",
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
                              "Already have an account? ",
                              style: AppWidget.SimpleTextFeildStyle(),
                            ),
                            SizedBox(width: 10.0),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LogIn(),
                                  ),
                                );
                              },
                              child: Text(
                                "Login",
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

///2:10:40
