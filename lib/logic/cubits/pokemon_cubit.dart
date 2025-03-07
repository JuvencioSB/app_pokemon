import 'package:app_pokemon/data/repositories/pokemon_repository.dart';
import 'package:app_pokemon/logic/states/pokemon_state.dart';
// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:app_pokemon/module/pokemon_detalle.dart';

@injectable
class PokemonCubit extends Cubit<PokemonState> {
  final PokemonRepository repository;
  int ids = 1;
  PokemonCubit(this.repository) : super(PokemonInitial());

  // ignore: non_constant_identifier_names
  Future<void> CargarPokemons() async {
    try {
      emit(PokemonLoading());
      final pokemons = await repository.getPokemons(ids);
      emit(PokemonLoaded(pokemons));
    } catch (e) {
      emit(PokemonError(e.toString()));
    }
  }

  Future<void> loadLocalInfoPokemos() async {
    try {
      emit(PokemonLoading());
      final infoPokemos = await repository.getPokemonsFromDatabase();
      emit(PokemonLoaded(infoPokemos));
    } catch (e) {
      emit(PokemonError(e.toString()));
    }
  }

  void saveInfoPokemo(Info_pokemo infoPokemo, List<Type> tipos) async {
    try {
      await repository.saveInfoPokemo(infoPokemo);
      for (var tipo in tipos) {
        if (kDebugMode) {
          print(tipo.tipo);
        }
        await repository.savetype(tipo);
      }
      final infoPokemos = await repository.getPokemons(ids);
      emit(PokemonLoaded(infoPokemos));
    } catch (e) {
      emit(PokemonError(e.toString()));
    }
  }

  void nextPage() {
    ids = ids + 10;
    CargarPokemons();
  }

  void previousPage() {
    if (ids > 0) {
      ids = ids - 10;
      CargarPokemons();
    }
  }

//Metodo para puebas
  Future<void> imprimirdatos() async {
    try {
      List<Info_pokemo> func = await repository.getPokemons(ids);
    } catch (e) {
      if (kDebugMode) {
        print("No funciono el metodo imprimir datos$e");
      }
    }
  }
}
