import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'film.dart';

//récupérer le contenu de l'API à partir du JSONPlaceholder à l'aide de la méthode http.get().

Future<Film> fetchFilm() async {
  final response = await http.get(Uri.parse(
      'https://api.themoviedb.org/3/movie/550?api_key=b92f107bc57b60a06438abe4238795f4'));
  if (response.statusCode == 200) {
    return Film.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('error');
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<Film> futureFilm;

  @override
  void initState() {
    super.initState();
    futureFilm = fetchFilm();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Netflix'),
      ),
      body: Center(
        child: FutureBuilder<Film>(
          future: futureFilm,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data!.name);
            } else {
              return Text("error");
            }
          },
        ),
      ),
    );
  }
}
