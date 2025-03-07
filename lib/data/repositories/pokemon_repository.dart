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

  Future<List<Info_pokemo>> getPokemons(int ids) async {
    List<Info_pokemo> pokemons = [];

    for (int i = ids; i <= ids + 10; i++) {
      final response = await _apiService.getdatos("$i/");
      if (response.statusCode == 200) {
        pokemons.add(Info_pokemo.fromJson(response));
      }
    }
    return pokemons;
  }

  /* Future<void> saveInfoPokemos(List<Info_pokemo> infoPokemos) async {
    final infoPokemoDao = _database.pokemonDao;
    // Limpiar la tabla antes de guardar nuevos datos  await infoPokemoDao.deleteAllInfoPokemos();
    await infoPokemoDao.insertPokemon(infoPokemos);
  }*/
  Future<void> saveInfoPokemo(Info_pokemo infoPokemo) async {
    final infoPokemoDao = _database.pokemonDao;
    await infoPokemoDao.insertInfoPokemo(infoPokemo);
  }

  Future<void> savetype(Type tipo) async {
    final typo = _database.pokemonDao;
    await typo.insertType(tipo);
  }

  Future<List<Info_pokemo>> getPokemonsFromDatabase() async {
    final data = _database.pokemonDao;
    final pokemonesList = await data.findAllInfoPokemos();

    List<Info_pokemo> retorno = [];
    for (var pokemon in pokemonesList) {
      pokemon.tipos =
          await _database.pokemonDao.findTypesForPokemon(pokemon.nombre);
      retorno.add(pokemon);
    }
    return retorno;
  }
}
