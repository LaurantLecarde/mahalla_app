import 'package:flutter/material.dart';
import 'package:mahalla_app/mahalla_app/presentation/screens/bottom_screens/communal_screens/communal_payment.dart';
import 'package:mahalla_app/mahalla_app/presentation/screens/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});



  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      /// TODO: GoogleFonts.nunitoSans() <==== SHUNDAN FOYDALANINGLAR TEXTNI STYLESIGA

      theme: ThemeData(
        useMaterial3: true,
        primaryColor:const Color(0xfffdfdfd)
      ),
      home: const CommunalPayment(),
    );
  }
}


