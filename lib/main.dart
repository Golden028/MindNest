import 'package:flutter/material.dart';
import 'constants.dart'; // Import warna global
import 'login.dart'; // Import halaman Login

void main() {
  runApp(const MindNestApp());
}

class MindNestApp extends StatelessWidget {
  const MindNestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MindNest',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: kBackgroundColor,
        colorScheme: ColorScheme.fromSeed(seedColor: kPrimaryColor),
        useMaterial3: true,
        fontFamily: 'Poppins', // Pastikan font sudah diatur di pubspec.yaml
      ),
      // Pintu masuk aplikasi sekarang ke LoginPage
      home: const LoginPage(),
    );
  }
}