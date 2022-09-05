

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'film.dart';


//récupérer le contenu de l'API à partir du JSONPlaceholder à l'aide de la méthode http.get().
//Convertissez le corps de la réponse en une carte JSON avec le package dart:convert.
  Future<List<Film>> fetch_all_Film() async {
    String api =
        'https://api.themoviedb.org/3/movie/popular?api_key=26bd7bf489b6d251603a35783da5959d';
    final response = await http.get(Uri.parse(api));

//convertissez la carte JSON un Film à l'aide de la méthode de fabrique fromJson(
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      Iterable list = result["results"];
      return list.map((e) => Film.fromJson(e)).toList();
    } else {
      //seno un message d'errur
      throw Exception('Errur');
    }
  }

