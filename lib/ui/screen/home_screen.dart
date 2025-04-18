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
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(30),
                      ),
                      onPressed: pokemonCubit.CargarPokemons,
                      child: const Icon(Icons.refresh, size: 20),
                    ),
                    const Text('Presiona el botón para cargar Pokémon')
                  ],
                );
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
                              width: 150,
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
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                    content: Text(
                                        '${state.pokemons[index].nombre} guardado')));
                              },
                              child: const Text("Descargar"),
                            ),
                          );
                        },
                      ),
                    ),
                    Container(
                      color: Colors.red,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          if (pokemonCubit.ids > 20)
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shadowColor: Colors.red,
                                  backgroundColor: Colors.yellowAccent),
                              onPressed: () {
                                context.read<PokemonCubit>().previousPage();
                              },
                              child: const Text('Anterior'),
                            ),
                          GestureDetector(
                            onTap: () => showBottomSheet(
                              context: context,
                              builder: (context) => Container(
                                color: Colors.white,
                                height: 400,
                                child: Column(
                                  children: [
                                    Container(
                                      color: Colors.white,
                                      child: const Text(
                                        'Selecciona la página',
                                        style: TextStyle(
                                            color: Colors.white,
                                            backgroundColor: Colors.yellow),
                                      ),
                                    ),
                                    Expanded(
                                      child: ListView.builder(
                                        itemCount: pokemonCubit.totalPage,
                                        itemBuilder: (context, index) {
                                          return ListTile(
                                            title: const Text(
                                              "Pagina",
                                              style: TextStyle(
                                                  backgroundColor:
                                                      Colors.white),
                                            ),
                                            subtitle: Center(
                                                child: InkWell(
                                                    onTap: () {
                                                      context
                                                          .read<PokemonCubit>()
                                                          .selectPage(index);

                                                      Navigator.pop(context);
                                                    },
                                                    child: Text((index + 1)
                                                        .toString()))),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            child: Text(
                              'Página ${(pokemonCubit.ids / 20).ceil()} de ${pokemonCubit.totalPage}',
                              style: const TextStyle(
                                  color: Colors.blue,
                                  backgroundColor: Colors.white),
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shadowColor: Colors.amber,
                                backgroundColor: Colors.yellow),
                            onPressed: () {
                              context.read<PokemonCubit>().nextPage();
                            },
                            child: const Text('Siguiente'),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              } else if (state is PokemonError) {
                return ListView(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(30),
                      ),
                      onPressed: pokemonCubit.CargarPokemons,
                      child: const Icon(Icons.refresh, size: 20),
                    ),
                    Text('Error: ${state.message}')
                  ],
                );
              } else {
                return Column(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(30),
                      ),
                      onPressed: pokemonCubit.CargarPokemons,
                      child: const Icon(Icons.refresh, size: 20),
                    ),
                    const Text('Estado desconocido')
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
