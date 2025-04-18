import 'package:app_pokemon/logic/cubits/pokemon_cubit.dart';
import 'package:app_pokemon/ui/screen/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:app_pokemon/ui/screen/pokemonpage.dart';
import 'package:flutter/material.dart';
import 'package:app_pokemon/injectable_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //setup();
  configureDependencies(); // Inicializa las dependencias
  await getIt.allReady();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PokemonCubit>(
          create: (context) => getIt<PokemonCubit>(),
        ),
      ],
      child: MaterialApp.router(
        title: 'PokeInfo :)',
        routerConfig: router,
      ),
    );
  }
}

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
        path: '/',
        builder: (context, state) => BlocProvider(
              create: (context) => getIt<PokemonCubit>(),
              child: const HomeScreen(),
            )),
    GoRoute(
      path: '/pokemonlocal',
      builder: (context, state) => BlocProvider(
        create: (context) => getIt<PokemonCubit>(),
        child: const PokemonPage(),
      ),
    )
  ],
);
