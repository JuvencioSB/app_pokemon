import 'package:app_pokemon/module/pokemon_detalle.dart';
import 'package:app_pokemon/ui/screen/class/navigation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:app_pokemon/data/database/app_database.dart';

class PokemonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Descargados')),
      drawer: navigations(context),
      body: FutureBuilder<AppDatabase>(
        future: GetIt.instance.getAsync<AppDatabase>(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            final db = snapshot.data;

            return FutureBuilder<List<Info_pokemo>>(
              future: db!.pokemonDao.findAllInfoPokemos(),
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
                      print("Total Pokemon" + pokemons.length.toString());
                      return ListTile(
                        subtitle: Container(
                          child: FadeInImage.assetNetwork(
                            placeholder: 'assets/carga.gif',
                            image: pokemons[index].imagen,
                            fadeInDuration: Duration(seconds: 2),
                          ),
                        ),
                        title: Text(pokemons[index].nombre.toString()),
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
