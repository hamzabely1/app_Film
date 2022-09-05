import 'dart:async';
import 'dart:convert';
import 'package:flutter_application_1/model/film.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Film_detail extends StatelessWidget {
  Film_detail({Key? key}) : super(key: key);
  static const routeName = "Film_detail";
  var _id;
  var _titre;

  Future fetchDetail(String id) async {
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/$id?api_key=26bd7bf489b6d251603a35783da5959d'));

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      final list = result;
      _id = list["id"] as int;
      _titre = list["original_title"] as String;

      print(_titre);
    } else {
      print('oui');
    }
  }

  @override
  Widget build(BuildContext context) {
    final filmId = ModalRoute.of(context)!.settings.arguments.toString();
    return FutureBuilder(
      future: fetchDetail(filmId),
      builder: (context, data) {
        while (_id == null) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red,
          ),
          body: Center(child: Text(_titre)),
        );
      },
    );
  }
}
