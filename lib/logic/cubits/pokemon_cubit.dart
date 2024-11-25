import 'package:app_pokemon/data/repositories/pokemon_repository.dart';
import 'package:app_pokemon/logic/states/pokemon_state.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class PokemonCubit extends Cubit<PokemonState> {
  final PokemonRepository repository;

  PokemonCubit(this.repository) : super(PokemonInitial());

  void fetchPokemons() async {
    try {
      emit(PokemonLoading());
      final pokemons = await repository.fetchPokemons();
      emit(PokemonLoaded(pokemons));
    } catch (e) {
      emit(PokemonError(e.toString()));
    }
  }
}
