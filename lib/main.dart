import 'package:car_tracking/firebase_options.dart';
import 'package:car_tracking/pages/HomePage.dart';
// import 'package:car_tracking/pages/HomePage.dart';
import 'package:car_tracking/pages/details_page.dart';
import 'package:car_tracking/pages/reg_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async{

WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
options: DefaultFirebaseOptions.currentPlatform,

);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      home: HomePage()
    );
  }
}
