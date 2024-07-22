import 'package:flutter/material.dart';
import 'package:pokedextamires/model/api.dart';
import 'package:pokedextamires/widgets/appbar.dart';
import 'package:pokedextamires/widgets/colors.dart';
import 'package:provider/provider.dart';

class FavoriteList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetAppBar(),
      body: Consumer<PokemonProvider>(
        builder: (context, itemProvider, child) {
          final favoritedItems = itemProvider.favoritedItems;
          if (favoritedItems.isEmpty) {
            return Center(child: Text('Não existe Pokemons Favoritos.'));
          }
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: favoritedItems.length,
              itemBuilder: (context, index) {
                final item = favoritedItems[index];
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: InkWell(
                    onTap: () => showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text(item.name),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.network(item.img),
                            SizedBox(height: 10),
                            Text('Tipo: ${item.type.join(', ')}'),
                            Text('Altura: ${item.height}'),
                            Text('Peso: ${item.weight}'),
                            Text('Fraquezas: ${item.weaknesses.join(', ')}'),
                          ],
                        ),
                        actions: [
                          TextButton(
                            child: Text('Fechar'),
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                        ],
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: getColorFromType(item.type.first),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Image.network(
                              item.img,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text(
                                  item.name,
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Tipo: ${item.type.join(', ')}',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.remove_circle, color: Colors.red),
                            onPressed: () {
                              itemProvider.removeFavorite(item);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}