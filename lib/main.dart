import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/film_detail.dart';
import 'package:flutter_application_1/screens/film_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    
      title: 'Netflix',
      home: HomePage(),
     routes: {
Film_detail.routeName:(context)=>Film_detail()
     },
    );
  }
}
