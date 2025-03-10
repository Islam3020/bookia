import 'package:bookia/features/into/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BookiaApp());
}
class BookiaApp extends StatelessWidget {
  const BookiaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  SplashScreen(),
    );
  }
}