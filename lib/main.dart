import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:food_delivery_app_8sc_2025/pages/bottomnav.dart';
import 'package:food_delivery_app_8sc_2025/pages/detail_page.dart';
import 'package:food_delivery_app_8sc_2025/pages/home.dart';
import 'package:food_delivery_app_8sc_2025/pages/login.dart';
import 'package:food_delivery_app_8sc_2025/pages/onboarding.dart';
import 'package:food_delivery_app_8sc_2025/pages/signup.dart';
import 'package:food_delivery_app_8sc_2025/service/constant.dart';
// 1. IMPORTANTE: Importamos el archivo que generó la terminal
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = publishedKey;

  // 2. MODIFICAMOS ESTA PARTE PARA QUE JALE EN WEB
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true, // Esto hace que se vea más moderno (Material 3)
      ),
      // Aquí defines cuál es tu primera pantalla
      // home: Onboarding(),
      home: SignUp(),
    );
  }
}

// Nota: He borrado la clase 'MyHomePage' y '_MyHomePageState' que venían por defecto
// porque ya no las usas (tienes tus propias páginas como LogIn y Home).
// Tu código queda mucho más limpio así.
