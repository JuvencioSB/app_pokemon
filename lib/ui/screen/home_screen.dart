import 'package:app_pokemon/injectable_config.dart';
import 'package:app_pokemon/logic/cubits/pokemon_cubit.dart';
import 'package:app_pokemon/logic/states/pokemon_state.dart';
import 'package:app_pokemon/ui/screen/class/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final pokemonCubit = getIt<PokemonCubit>();
    return BlocProvider(
        create: (context) => pokemonCubit,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.red,
            title: const Text(
              'PokeInfo :)',
              style: TextStyle(color: Colors.yellowAccent),
            ),
            iconTheme: const IconThemeData(color: Colors.white),
          ),
          drawer: navigations(context),
          body: Center(
            child: BlocBuilder<PokemonCubit, PokemonState>(
              bloc: pokemonCubit,
              builder: (context, state) {
                if (state is PokemonInitial) {
                  return const Text('Presiona el botón para cargar Pokémon');
                } else if (state is PokemonLoading) {
                  return const CircularProgressIndicator();
                } else if (state is PokemonLoaded) {
                  return Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: state.pokemons.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: FadeInImage.assetNetwork(
                                placeholder: 'assets/carga.gif',
                                width: 200,
                                image: state.pokemons[index].imagen,
                                fadeInDuration: const Duration(seconds: 4),
                              ),
                              title: Text(state.pokemons[index].nombre),
                              subtitle: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shadowColor: Colors.amber,
                                    backgroundColor: Colors.amberAccent),
                                onPressed: () {
                                  context.read<PokemonCubit>().saveInfoPokemo(
                                      state.pokemons[index],
                                      state.pokemons[index].tipos);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              '${state.pokemons[index].nombre} guardado')));
                                },
                                child: const Text("Descargar"),
                              ),
                            );
                          },
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              context.read<PokemonCubit>().previousPage();
                            },
                            child: const Text('Anterior'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              context.read<PokemonCubit>().nextPage();
                            },
                            child: const Text('Siguiente'),
                          ),
                        ],
                      ),
                    ],
                  );
                } else if (state is PokemonError) {
                  return Text('Error: ${state.message}');
                } else {
                  return const Text('Estado desconocido');
                }
              },
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              pokemonCubit.CargarPokemons();
            },
            child: const Icon(Icons.refresh),
          ),
        ));
  }
}
