import 'package:app_pokemon/module/pokemon_detalle.dart';
import 'package:injectable/injectable.dart';
import 'package:app_pokemon/data/services/api_service.dart';
import 'package:app_pokemon/data/database/app_database.dart';

@injectable
class PokemonRepository {
  final ApiService _apiService;
  final AppDatabase _database;
  PokemonRepository(this._apiService, this._database);
  /* Future<List<Pokemon>> fetchPokemons() async {
    final response = await _apiService.getPokemons();
    if (response.statusCode == 200) {
      final List<dynamic> data = response.data['results'];
      final pokemons = data.map((json) => Pokemon.fromJson(json)).toList();
      for (var pokemon in pokemons) {
        await _database.pokemonDao.insertPokemon(pokemon);
      }

      return pokemons;
    } else {
      throw Exception('Error al obtener los Pokémon');
    }
  }*/

  Future<List<Info_pokemo>> getPokemons() async {
    List<Info_pokemo> pokemons = [];
    for (int i = 1; i <= 20; i++) {
      final response = await _apiService.getdatos(i.toString() + "/");
      if (response.statusCode == 200) {
        pokemons.add(await Info_pokemo.fromJson(response));
      } else {
        print("Error en el metodo");
      }
    }
    return pokemons;
  }

  Future<List<dynamic>> getdatos(String name) async {
    final response = await _apiService.getdatos("emolga");
    if (response.statusCode == 200) {
      final List<dynamic> data = response.data['types'];
      print("Los  response" + response.data[{}].toString());
      //final pokemons = data.map((json) => Pokemon.fromJson(json)).toList();
      print("Conexion exitsa");
      print("Practica   " + data[0]["type"].toString());
      //   for (var v in pokemons) {
      obtenerName(response);
      obtnerSprite(response);
      obtenerTipo(response);
      print("Pruebas");

      return data;
      // }
    } else {
      throw Exception('Error al obtener los Pokémon');
    }
  }

  Future<List<Info_pokemo>> getPokemonsFromDatabase() async {
    return await _database.pokemonDao.findAllPokemons();
  }

  void obtenerName(dynamic response) async {
    dynamic data = response.data['name'];
    print(data.toString());
  }

  Future<void> obtnerSprite(dynamic response) async {
    dynamic data = response.data['sprites'];
    print(data["other"]["dream_world"]["front_default"].toString());
  }

  void obtenerTipo(dynamic response) async {
    dynamic data = response.data['types'];
    for (var type in data) {
      print(type["type"].toString());
    }
  }
}
