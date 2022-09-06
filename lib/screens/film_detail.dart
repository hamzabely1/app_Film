import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';




class Film_detail extends StatelessWidget {
  Film_detail({Key? key}) : super(key: key);
  static const routeName = "Film_detail";
  var _id;
  var _titre;
  var _image;
  var _date;
  var _duree;
  var _description;

  //récupérer le contenu de l'API  à l'aide de la méthode http.get().
  //avec l'identifiant que j'obtiens de la page film_list grace a onTap.


  Future fetchDetail(String id) async {
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/$id?api_key=26bd7bf489b6d251603a35783da5959d&language=fr-FR'));

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      final list = result;
      _id = list["id"] as int;
      _titre = list["title"] as String;
      _image = list["poster_path"] as String;
      _date = list["release_date"] as String;
      _duree = list["runtime"];
      _description = list["overview"];
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
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          _titre,
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.15,
                          ),
                        ),
                      )),
                  SizedBox(
                    width: 140,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.network(
                            "https://image.tmdb.org/t/p/original/" + _image)),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 30, 0, 10),
                    height: 60,
                    color: Colors.grey[300],
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(_date+" "+_duree.toString()+"m"),
                         const Text("animatio,Aventure,Comedie,Fantastique")
                        ],
                      ),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.all(10),
                      child: Row(
                        children: const [
                          Text(
                            "Synopsi",
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.15,
                            ),
                          ),
                        ],
                      )),
                  Container(
                      margin: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Text(
                            _description,
                            style: const TextStyle(
                              fontSize: 15.0,
                              letterSpacing: 0.30,
                            ),
                          ),
                        ],
                      ))
                ],
              ),
            ));
      },
    );
  }
}
