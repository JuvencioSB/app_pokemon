import 'package:app_pokemon/logic/cubits/pokemon_cubit.dart';
import 'package:app_pokemon/logic/states/pokemon_state.dart';
import 'package:app_pokemon/ui/screen/class/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PokemonPage extends StatelessWidget {
  const PokemonPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Cargar los Pokémon automáticamente al iniciar la pantalla
    context.read<PokemonCubit>().loadLocalInfoPokemos();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Descargados'),
      ),
      drawer: navigations(context),
      body: BlocBuilder<PokemonCubit, PokemonState>(builder: (context, state) {
        if (state is PokemonInitial) {
          return const Center(child: Text('Cargando Pokémon...'));
        } else if (state is PokemonLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is PokemonLoaded) {
          return ListView.builder(
            itemCount: state.pokemons.length,
            itemBuilder: (context, index) {
              final infoPokemo = state.pokemons[index];
              return ListTile(
                title: Text(infoPokemo.nombre),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FadeInImage.assetNetwork(
                      placeholder: 'assets/carga.gif',
                      width: 150,
                      image: state.pokemons[index].imagen,
                      fadeInDuration: const Duration(seconds: 3),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: infoPokemo.tipos
                          .map((type) => Text(type.tipo))
                          .toList(),
                    ),
                  ],
                ),
              );
            },
          );
        } else if (state is PokemonError) {
          return Center(child: Text('Error: ${state.message}'));
        } else {
          return const Center(child: Text('Estado desconocido'));
        }
      }),
    );
  }
}
