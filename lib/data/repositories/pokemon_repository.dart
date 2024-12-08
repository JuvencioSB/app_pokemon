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

  /* Future<void> saveInfoPokemos(List<Info_pokemo> infoPokemos) async {
    final infoPokemoDao = _database.pokemonDao;
    // Limpiar la tabla antes de guardar nuevos datos  await infoPokemoDao.deleteAllInfoPokemos();
    await infoPokemoDao.insertPokemon(infoPokemos);
  }*/
  Future<void> saveInfoPokemo(Info_pokemo infoPokemo) async {
    final infoPokemoDao = _database.pokemonDao;
    await infoPokemoDao.insertInfoPokemo(infoPokemo);

    print(infoPokemo.nombre.toString());
  }

  Future<void> savetype(Type tipo) async {
    final typo = _database.pokemonDao;
    await typo.insertType(tipo);
    print("Se insertos el tipo del pokemon " +
        tipo.pokemon.toString() +
        " " +
        tipo.tipo.toString());
  }

  Future<List<Info_pokemo>> getPokemonsFromDatabase() async {
    final data = await _database.pokemonDao;
    final pokemonesList = await data.findAllInfoPokemos();
    print(pokemonesList.length.toString() + "datos recojidos");
    List<Info_pokemo> retorno = [];
    for (var pokemon in pokemonesList) {
      pokemon.tipos =
          await _database.pokemonDao.findTypesForPokemon(pokemon.nombre);
      retorno.add(pokemon);
      print(pokemon.nombre + "se agrgo el tipo");
      for (var datospoke in retorno) {
        print("El pokemon es " + datospoke.nombre);
        for (var type in datospoke.tipos) {
          print("El tipo de es: " + type.tipo);
        }
      }
    }
    return retorno;
  }
}
