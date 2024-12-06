import 'package:app_pokemon/module/pokemon_detalle.dart';
import 'package:floor/floor.dart';

@dao
abstract class PokemonDao {
  @Query('SELECT * FROM Pokemon')
  Future<List<Info_pokemo>> findAllPokemons();

  @insert
  Future<void> insertPokemon(Info_pokemo pokemon);

  @delete
  Future<void> deletePokemon(Info_pokemo pokemon);
}
