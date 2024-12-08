import 'package:app_pokemon/injectable_config.dart';
import 'package:app_pokemon/logic/cubits/pokemon_cubit.dart';
import 'package:app_pokemon/logic/states/pokemon_state.dart';
import 'package:app_pokemon/ui/screen/class/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class PokemonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Cargar los Pokémon automáticamente al iniciar la pantalla
    context.read<PokemonCubit>().loadLocalInfoPokemos();
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokémon Locales'),
      ),
      body: BlocBuilder<PokemonCubit, PokemonState>(builder: (context, state) {
        if (state is PokemonInitial) {
          return Center(child: Text('Cargando Pokémon...'));
        } else if (state is PokemonLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is PokemonLoaded) {
          return ListView.builder(
            itemCount: state.pokemons.length,
            itemBuilder: (context, index) {
              final infoPokemo = state.pokemons[index];
              return ListTile(
                title: Text(infoPokemo.nombre),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(infoPokemo.imagen),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: infoPokemo.tipos
                          .map((type) => Text(type.tipo))
                          .toList(),
                    ),
                  ],
                ),
                onTap: () {
                  context
                      .read<PokemonCubit>()
                      .saveInfoPokemo(infoPokemo, infoPokemo.tipos);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('${infoPokemo.nombre} guardado')),
                  );
                },
              );
            },
          );
        } else if (state is PokemonError) {
          return Center(child: Text('Error: ${state.message}'));
        } else {
          return Center(child: Text('Estado desconocido'));
        }
      }),
    );
  }
}
