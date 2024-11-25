import 'package:injectable/injectable.dart';
import 'package:app_pokemon/data/services/api_service.dart';
import 'package:app_pokemon/module/pokemon.dart';
import 'package:app_pokemon/data/database/app_database.dart';

@injectable
class PokemonRepository {
  final ApiService _apiService;
  final AppDatabase _database;
  PokemonRepository(this._apiService, this._database);
  Future<List<Pokemon>> fetchPokemons() async {
    final response = await _apiService.getPokemons();
    if (response.statusCode == 200) {
      final List<dynamic> data = response.data['results'];
      final pokemons = data.map((json) => Pokemon.fromJson(json)).toList();
      for (var v in pokemons) {
        await _database.pokemonDao.insertPokemon(v);
      }

      return pokemons;
    } else {
      throw Exception('Error al obtener los Pokémon');
    }
  }

  Future<List<Pokemon>> getPokemonsFromDatabase() async {
    return await _database.pokemonDao.findAllPokemons();
  }
}
