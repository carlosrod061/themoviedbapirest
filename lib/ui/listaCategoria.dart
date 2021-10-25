import 'package:apirestmovies/api/themoviedbservice.dart';
import 'package:apirestmovies/ui/cajapelicula.dart';
import 'package:apirestmovies/ui/spinnerwidget.dart';
import 'package:flutter/material.dart';

class ListaCategoria extends StatefulWidget {
  String categoriaG = "";
  ListaCategoria(String categoria) {
    this.categoriaG = categoria;
  }

  @override
  _ListaCategoriaState createState() => _ListaCategoriaState();
}

class _ListaCategoriaState extends State<ListaCategoria> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(tituloPantalla(this.widget.categoriaG))),
        body: FutureBuilder(
          //podría poner
          //initialData: [],
          future: TheMovieDBService.getMovies(this.widget.categoriaG),
          builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  var pelicula = snapshot.data![index];
                  return CajaPelicula(peli: pelicula);
                },
              );
            } else {
              return SpinnerWidget();
            }
          },
        ));
  }

  String tituloPantalla(String categoriaR) {
    switch (categoriaR) {
      case "top_rated":
        return "Mejor Calificadas";
      case "upcoming":
        return "Proximos Lanzamientos";
      case "popular":
        return "Populares";
      default:
        return "none";
    }
  }
}
