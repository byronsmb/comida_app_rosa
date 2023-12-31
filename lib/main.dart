import 'package:comida_app_rosa/hamburguesa_rosa.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFF7F6FF),
          iconTheme: IconThemeData(
            color: Colors.black, // Color de la flecha de retroceso
          ),
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 27, 27, 27),
        ),
        textTheme: GoogleFonts.latoTextTheme(),
        useMaterial3: true,
      ),
      home: const HamburguesaRosa(),
    );
  }
}
