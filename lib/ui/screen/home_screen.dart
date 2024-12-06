import 'package:app_pokemon/logic/cubits/pokemon_cubit.dart';
import 'package:app_pokemon/logic/states/pokemon_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pokemonCubit = GetIt.instance<PokemonCubit>();

    return BlocProvider(
        create: (context) => pokemonCubit,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Pokemon App'),
          ),
          body: Center(
            child: BlocBuilder<PokemonCubit, PokemonState>(
              bloc: pokemonCubit,
              builder: (context, state) {
                if (state is PokemonInitial) {
                  return Text('Presiona el botón para cargar Pokémon');
                } else if (state is PokemonLoading) {
                  return CircularProgressIndicator();
                } else if (state is PokemonLoaded) {
                  return ListView.builder(
                    itemCount: state.pokemons.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        subtitle: Container(
                          child: Image.network(state.pokemons[index].imagen),
                        ),
                        title: Text(state.pokemons[index].nombre),
                        onTap: () {
                          context
                              .read<PokemonCubit>()
                              .saveInfoPokemo(state.pokemons[index]);
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                  '${state.pokemons[index].nombre} guardado')));
                        },
                      );
                    },
                  );
                } else if (state is PokemonError) {
                  return Text('Error: ${state.message}');
                } else {
                  return Text('Estado desconocido');
                }
              },
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              pokemonCubit.CargarPokemons();
            },
            child: Icon(Icons.refresh),
          ),
        ));
  }
}
