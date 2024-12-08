import 'package:app_pokemon/data/repositories/pokemon_repository.dart';
import 'package:app_pokemon/logic/states/pokemon_state.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:app_pokemon/module/pokemon_detalle.dart';

@injectable
class PokemonCubit extends Cubit<PokemonState> {
  final PokemonRepository repository;

  PokemonCubit(this.repository) : super(PokemonInitial());

  void CargarPokemons() async {
    try {
      emit(PokemonLoading());
      final pokemons = await repository.getPokemons();
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
        print(tipo.tipo);
        await repository.savetype(tipo);
      }
      final infoPokemos = await repository.getPokemons();
      emit(PokemonLoaded(infoPokemos));
    } catch (e) {
      emit(PokemonError(e.toString()));
    }
  }

//Metodo para puebas
  Future<void> imprimirdatos() async {
    try {
      List<Info_pokemo> func = await repository.getPokemons();
    } catch (e) {
      print("No funciono el metodo imprimir datos" + e.toString());
    }
  }
}
