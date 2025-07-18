// import 'package:eduwave_app/pages/onboarding.dart';
import 'package:eduwave_app/pages/onboarding.dart';
// import 'package:eduwave_app/pages/testp.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: Scaffold(
        // appBar: AppBar(title: Text('')),
        body: Onboarding(),
      ),
    );
  }
}
