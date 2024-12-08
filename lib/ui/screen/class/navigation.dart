import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Widget navigations(
  BuildContext context,
) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        const DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: Text(
            'Menu',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
        ListTile(
          leading: const Icon(Icons.home),
          title: const Text('Inicio'),
          onTap: () {
            context.go('/');
          },
        ),
        ListTile(
          leading: const Icon(Icons.download_for_offline),
          title: const Text('Descargas'),
          onTap: () {
            // Navegar a la pantalla de configuración
            context.go('/pokemonlocal');
          },
        ),
      ],
    ),
  );
}
