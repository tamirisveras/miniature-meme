import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokedextamires/model/poke.dart';

class PokemonProvider with ChangeNotifier {
  List<Pokemon> _items = [];

  List<Pokemon> get items => _items;
  List<Pokemon> get favoritedItems => _items.where((item) => item.isFavorited).toList();

  void toggleFavoriteStatus(Pokemon item) {
    item.isFavorited = !item.isFavorited;
    notifyListeners();
  }

  void removeFavorite(Pokemon item) {
    item.isFavorited = false;
    notifyListeners();
  }

  Future<void> fetchItems() async {
    final url = 'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body)['pokemon'] as List<dynamic>;
        _items = data.map((json) => Pokemon.fromJson(json)).toList();
        notifyListeners();
      } else {
        throw Exception('Falha no carregamento');
      }
    } catch (error) {
      print(error);
    }
  }
}
