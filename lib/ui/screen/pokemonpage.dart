import 'package:app_pokemon/module/pokemon_detalle.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:app_pokemon/data/database/app_database.dart';

class PokemonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pokémones')),
      body: FutureBuilder<AppDatabase>(
        future: GetIt.instance.getAsync<AppDatabase>(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            final db = snapshot.data;
            return FutureBuilder<List<Info_pokemo>>(
              future: db!.pokemonDao.findAllPokemons(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  final pokemons = snapshot.data ?? [];
                  return ListView.builder(
                    itemCount: pokemons.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(pokemons[index].nombre),
                      );
                    },
                  );
                }
              },
            );
          }
        },
      ),
    );
  }
}
