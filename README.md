# App Pokémon

La **App Pokémon** es una aplicación móvil desarrollada con Flutter que permite a los usuarios explorar y gestionar información sobre Pokémon de manera interactiva. La aplicación está diseñada para ofrecer una experiencia fluida y atractiva, utilizando el patrón de arquitectura BLoC para la gestión eficiente del estado.

Este proyecto fue desarrollado como parte de mi portafolio profesional mientras busco nuevas oportunidades laborales en el desarrollo de software. Mi objetivo es demostrar mis habilidades en Flutter, gestión de estado con BLoC, y buenas prácticas de desarrollo.

## Características principales

- **Explorar Pokémon**: Obtén una lista de Pokémon con sus imágenes y detalles básicos.
- **Paginación dinámica**: Navega fácilmente entre diferentes páginas de Pokémon.
- **Guardar información**: Descarga y guarda información detallada de un Pokémon específico.
- **Interfaz amigable**: Diseño intuitivo con botones interactivos y listas dinámicas.
- **Selector de páginas**: Cambia rápidamente entre páginas utilizando un menú desplegable.
- **Manejo de errores**: Controla y muestra mensajes de error amigables en caso de fallos en la carga de datos o problemas de red.

## Tecnologías y herramientas utilizadas

- **Flutter**: Framework de desarrollo multiplataforma para crear aplicaciones nativas.
- **Dart**: Lenguaje de programación utilizado en Flutter.
- **BLoC (Business Logic Component)**: Arquitectura para la gestión reactiva del estado.
- **go_router**: Navegación declarativa y gestión de rutas.
- **get_it**: Inyección de dependencias para un código más modular y escalable.
- **Inyección de dependencias**: Configuración mediante `injectable` para facilitar la modularidad.

## Cómo ejecutar el proyecto

1. Clona este repositorio en tu máquina local:
   ```bash
   git clone <URL_DEL_REPOSITORIO>
   ```
2. Asegúrate de tener Flutter instalado en tu sistema. Puedes verificarlo ejecutando:
   ```bash
   flutter doctor
   ```
3. Instala las dependencias del proyecto:
   ```bash
   flutter pub get
   ```
4. Ejecuta la aplicación en un emulador o dispositivo físico:
   ```bash
   flutter run
   ```

## Estructura del proyecto

- **lib/**: Contiene el código fuente principal.
  - **ui/**: Widgets y pantallas de la interfaz de usuario.
  - **logic/**: Cubits y estados para la gestión de la lógica de negocio.
  - **injectable_config.dart**: Configuración para la inyección de dependencias.
- **assets/**: Recursos estáticos como imágenes y animaciones.

## Próximas mejoras

- **Detalles avanzados**: Mostrar estadísticas y habilidades de cada Pokémon.
- **Búsqueda inteligente**: Implementar un sistema de búsqueda por nombre o tipo.
- **Favoritos**: Permitir a los usuarios marcar Pokémon como favoritos.
- **Animaciones mejoradas**: Agregar transiciones y efectos visuales para una experiencia más atractiva.

## Contribuciones

¡Las contribuciones son bienvenidas! Si deseas colaborar, por favor abre un issue o envía un pull request con tus mejoras.

---

¡Explora el mundo de los Pokémon y disfruta de esta experiencia interactiva!

---

**Nota**: Actualmente estoy buscando empleo como desarrollador de software. Si estás interesado en mi perfil, no dudes en contactarme:

- **Correo electrónico**: [juvenciohalo2@gmail.com](mailto:juvenciohalo2@gmail.com)
