import 'package:app_pokemon/logic/cubits/pokemon_cubit.dart';
import 'package:app_pokemon/ui/screen/home_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:app_pokemon/ui/screen/pokemonpage.dart';
import 'package:flutter/material.dart';
import 'package:app_pokemon/injectable_config.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setup();

  await getIt.allReady();
  configureDependencies(); // Inicializa las dependencias
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokemon ddpp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => GetIt.instance<PokemonCubit>(),
        child: PokemonPage(),
      ),
    );
  }
}

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => HomeScreen(),
    ),
    GoRoute(
      path: '/pokemon/:id',
      builder: (context, state) {
        return PokemonPage();
      },
    ),
  ],
);
