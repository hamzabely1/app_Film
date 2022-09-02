import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../providers/fetch_film.dart';
import '../providers/film.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 
  

  void ma_list_de_film() async {
    final film = await fetchFilm();
    film_array.addAll(film);
    print(film_array[1].name);
  }

  @override
  Widget build(BuildContext context) {
    ma_list_de_film();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Netflix'),
      ),
      body: Center(
       

      ),
    );
  }
}
