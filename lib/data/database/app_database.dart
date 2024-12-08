import 'dart:async';
import 'package:app_pokemon/module/pokemon_detalle.dart';
import 'package:floor/floor.dart';
import 'package:get_it/get_it.dart';
// ignore: depend_on_referenced_packages
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:app_pokemon/data/dao/pokemon_dao.dart';
import 'package:injectable/injectable.dart';

part 'app_database.g.dart'; // El código generado se almacenará aquí

@Database(version: 1, entities: [Info_pokemo, Type])
abstract class AppDatabase extends FloorDatabase {
  InfoPokemoDao get pokemonDao;

  @factoryMethod
  static Future<AppDatabase> create() async {
    return await $FloorAppDatabase
        .databaseBuilder('app_database2.db')
        .addCallback(Callback(
      onCreate: (database, version) {
        if (!GetIt.instance.isRegistered<AppDatabase>()) {
          GetIt.instance
              .registerSingleton<AppDatabase>(database as AppDatabase);
        }
      },
    )).build();
  }
}
