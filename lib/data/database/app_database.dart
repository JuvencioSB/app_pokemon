import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:app_pokemon/module/pokemon.dart';
import 'package:app_pokemon/data/dao/pokemon_dao.dart';
import 'package:injectable/injectable.dart';
part 'app_database.g.dart'; // El código generado se almacenará aquí

@Database(version: 1, entities: [Pokemon])
abstract class AppDatabase extends FloorDatabase {
  PokemonDao get pokemonDao;

  @factoryMethod
  static Future<AppDatabase> create() async {
    return await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  }
}
