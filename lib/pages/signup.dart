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
  bool _isPasswordVisible = false;

  registration() async {
    if (password != null &&
        namecontroller.text != "" &&
        mailcontroller.text != "") {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        String Id = randomAlphaNumeric(10);

        Map<String, dynamic> userInfoMap = {
          "Name": namecontroller.text,
          "Email": mailcontroller.text,
          "Id": Id,
          "Wallet": "0",
        };
        await SharedpreferenceHelper().saveUserEmail(email);
        await SharedpreferenceHelper().saveUserName(namecontroller.text);
        await SharedpreferenceHelper().saveUserId(Id);
        await DatabaseMethods().addUserDetails(userInfoMap, Id);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.green,
            content: Text(
              "Registered Successfully",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ),
        );
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BottomNav()),
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text(
                "Password Provided is too Weak",
                style: TextStyle(fontSize: 18.0),
              ),
            ),
          );
        } else if (e.code == "email-already-in-use") {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text(
                "Account Already exists",
                style: TextStyle(fontSize: 18.0),
              ),
            ),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 2.5,
              padding: EdgeInsets.only(top: 30.0),
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
                    height: 180,
                    fit: BoxFit.fill,
                    width: 240,
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
            Container(
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height / 3.2,
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
                  height: MediaQuery.of(context).size.height / 1.65,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20.0),
                        Center(
                          child: Text(
                            "SignUp",
                            style: AppWidget.HeadlineTextFeildStyle(),
                          ),
                        ),
                        SizedBox(height: 30.0),
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
                            obscureText: !_isPasswordVisible,
                            controller: passwordcontroller,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Enter Password",
                              prefixIcon: Icon(Icons.password_outlined),
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _isPasswordVisible = !_isPasswordVisible;
                                  });
                                },
                                child: Icon(
                                  _isPasswordVisible
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 30.0),
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
                              height: 60,
                              decoration: BoxDecoration(
                                color: Color(0xffef2b39),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Center(
                                child: Text(
                                  "Sign Up",
                                  style: AppWidget.boldwhiteTextFeildStyle(),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 30.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have an account?",
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
                                "LogIn",
                                style: AppWidget.boldTextFeildStyle(),
                              ),
                            ),
                          ],
                        ),
                      ],
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
