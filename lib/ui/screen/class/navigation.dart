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
          leading: Icon(Icons.home),
          title: Text('Inicio'),
          onTap: () {
            context.go('/');
          },
        ),
        ListTile(
          leading: Icon(Icons.download_for_offline),
          title: Text('Descargas'),
          onTap: () {
            // Navegar a la pantalla de configuración
            context.go('/pokemonlocal');
          },
        ),
      ],
    ),
  );
}
