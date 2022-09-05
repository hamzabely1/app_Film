// ignore_for_file: must_be_immutable

import 'dart:async';
import 'dart:convert';
import 'package:flutter_application_1/model/film.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Film_detail extends StatelessWidget {
   Film_detail({Key? key}) : super(key: key);
  static const routeName = "Film_detail";
  var _id;
  var _title;
  var _image;
  var _description;
  var _date_de_sorti;
  var _langue_original;
  var _vote;


  Future fetchDetail(String id) async {
    final response = await http.get(
        Uri.parse('https://api.themoviedb.org/3/movie/popular?api_key=$id'));

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      final list = result['results'];

      _id = list["id"];
      _title = list["title"];
      _image = list["poster_path"];
      _date_de_sorti = list["release_date"];
      _langue_original = list["original_language"];
      _vote = list["vote_average"];
      _description = list["overview"];
    }
  }

  @override
  Widget build(BuildContext context) {
    final filmId = ModalRoute.of(context)!.settings.arguments.toString();
    return FutureBuilder(
      future: fetchDetail(filmId),
      builder: (context, data) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red,
       
           
          ),
          body: Center(child: Text(_image)),
        );
      },
    );
  }
}
