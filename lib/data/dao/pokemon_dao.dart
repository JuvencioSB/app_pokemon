import 'package:app_pokemon/module/pokemon_detalle.dart';
import 'package:floor/floor.dart';

@dao
abstract class InfoPokemoDao {
  @Query('SELECT * FROM info_pokemo')
  Future<List<Info_pokemo>> findAllInfoPokemos();
  @Query('SELECT * FROM type WHERE pokemon = :pokemon')
  Future<List<Type>> findTypesForPokemon(String pokemon);
  @insert
  Future<void> insertInfoPokemo(Info_pokemo infoPokemo);
  @insert
  Future<void> insertType(Type type);
  @Query('DELETE FROM info_pokemo')
  Future<void> deleteAllInfoPokemos();
  @Query('DELETE FROM type')
  Future<void> deleteAllTypes();
}
