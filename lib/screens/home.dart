import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_application_1/screens/film_detail.dart';
import 'package:http/http.dart' as http;

import '../model/fetch_film.dart';
import '../model/film.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Film> _film = [];

  @override
  void initState() {
    super.initState();
    ma_list_de_film();
  }

  void ma_list_de_film() async {
    final film = await fetch_all_Film();
    setState(() {
      _film = film;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Netflix'),
      ),
      body: ListView.builder(
        itemCount: _film.length,
        itemBuilder: (context, index) {
          final film = _film[index];
          return ListTile(
            title: Row(
              children: [
                SizedBox(
                  width: 120,
                  child: ClipRRect(
                      child: Image.network(
                          "https://image.tmdb.org/t/p/original/" +
                              _film[index].image),
                      borderRadius: BorderRadius.circular(5)),
                ),
                Flexible(
                    child: Padding(
                        padding: const EdgeInsets.all(9.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(_film[index].title),
                            Text(_film[index].date)
                          ],
                        ))),
              ],
            ),
            onTap: () {
              Navigator.push(context, Film_detail());
            },
          );
        },
      ),
    );
  }
}
