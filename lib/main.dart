import 'package:flutter/material.dart';
import 'package:movie_db/src/core/configuration/dependency_injection/get_it_configuration.dart';
import 'package:movie_db/src/presentation/home/home_screen.dart';

void main() {
  getItConfiguration();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}
