import 'package:flutter/material.dart';
import 'package:pokedextamires/provider/favorite.dart';
import 'package:pokedextamires/provider/home.dart';
import 'package:pokedextamires/model/api.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PokemonProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: PokemonListHome(),
        routes: {
          '/favorites': (context) => FavoriteList(),
        },
      ),
    );
  }
}