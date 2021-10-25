import 'package:apirestmovies/api/themoviedbservice.dart';
import 'package:apirestmovies/ui/cajapelicula.dart';
import 'package:apirestmovies/ui/listaCategoria.dart';
import 'package:apirestmovies/ui/spinnerwidget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MovieDBPage(),
    );
  }
}

class MovieDBPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Seleccione una categoria')),
        body: ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.stars_sharp),
              title: Text('Mejor Calificadas'),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ListaCategoria("top_rated"))),
            ),
            ListTile(
              leading: Icon(Icons.new_releases_outlined),
              title: Text('Populares'),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ListaCategoria("popular"))),
            ),
            ListTile(
              leading: Icon(Icons.movie_sharp),
              title: Text('Proximos Lanzamientos'),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ListaCategoria("upcoming"))),
            ),
          ],
        ));
  }
}
