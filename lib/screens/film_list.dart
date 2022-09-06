
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/film_detail.dart';
import '../model/fetch_film.dart';
import '../model/film.dart';

DateTime today = new DateTime.now();

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
        backgroundColor: Colors.red[900],
        title: Center(child: Text("Netflix"),),
      ),
      body: ListView.builder(
        itemCount: _film.length,
        itemBuilder: (context, index) {
          final film = _film[index];
          return GestureDetector(
              onTap: () {
                var i = _film[index].id;
                Navigator.of(context)
                    .pushNamed(Film_detail.routeName, arguments: i);
              },
              child: Card(
                  margin: EdgeInsets.all(9.0),
                  child: Row(children: [
                    SizedBox(
                      width: 100,
                      child: ClipRRect(
                          child: Image.network(
                              "https://image.tmdb.org/t/p/original/" +
                                  _film[index].image),
                          borderRadius: BorderRadius.circular(5)),
                    ),
                    Flexible(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                margin: const EdgeInsets.fromLTRB(1, 5, 5, 5),
                                child: Text(_film[index].titre,
                                    style: const TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 0.15,
                                    ))),
                            Text(_film[index].date,
                                style: const TextStyle(
                                    fontSize: 13.0, color: Colors.grey)),
                            Container(
                                width: 260,
                                height: 34,
                                margin: const EdgeInsets.fromLTRB(1, 25, 5, 5),
                                child: Text(_film[index].description,
                                    style: const TextStyle(
                                      fontSize: 14.0,
                                      letterSpacing: 0.15,
                                    ))),
                          ]),
                    ))
                  ])));
        },
      ),
    );
  }
}
