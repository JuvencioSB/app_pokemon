// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  InfoPokemoDao? _pokemonDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `info_pokemo` (`nombre` TEXT NOT NULL, `imagen` TEXT NOT NULL, PRIMARY KEY (`nombre`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `type` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `pokemon` TEXT NOT NULL, `tipo` TEXT NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  InfoPokemoDao get pokemonDao {
    return _pokemonDaoInstance ??= _$InfoPokemoDao(database, changeListener);
  }
}

class _$InfoPokemoDao extends InfoPokemoDao {
  _$InfoPokemoDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _info_pokemoInsertionAdapter = InsertionAdapter(
            database,
            'info_pokemo',
            (Info_pokemo item) => <String, Object?>{
                  'nombre': item.nombre,
                  'imagen': item.imagen
                }),
        _typeInsertionAdapter = InsertionAdapter(
            database,
            'type',
            (Type item) => <String, Object?>{
                  'id': item.id,
                  'pokemon': item.pokemon,
                  'tipo': item.tipo
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Info_pokemo> _info_pokemoInsertionAdapter;

  final InsertionAdapter<Type> _typeInsertionAdapter;

  @override
  Future<List<Info_pokemo>> findAllInfoPokemos() async {
    return await _queryAdapter.queryList('SELECT * FROM info_pokemo',
        mapper: (Map<String, Object?> row) => Info_pokemo(
            nombre: row['nombre'] as String,
            imagen: row['imagen'] as String,
            tipos: []));
  }

  @override
  Future<List<Type>> findTypesForPokemon(String pokemon) async {
    return await _queryAdapter.queryList(
        'SELECT * FROM type WHERE pokemon = ?1',
        mapper: (Map<String, Object?> row) => Type(
            row['id'] as int?, row['tipo'] as String, row['pokemon'] as String),
        arguments: [pokemon]);
  }

  @override
  Future<void> deleteAllInfoPokemos() async {
    await _queryAdapter.queryNoReturn('DELETE FROM info_pokemo');
  }

  @override
  Future<void> deleteAllTypes() async {
    await _queryAdapter.queryNoReturn('DELETE FROM type');
  }

  @override
  Future<void> insertInfoPokemo(Info_pokemo infoPokemo) async {
    await _info_pokemoInsertionAdapter.insert(
        infoPokemo, OnConflictStrategy.abort);
  }

  @override
  Future<void> insertType(Type type) async {
    await _typeInsertionAdapter.insert(type, OnConflictStrategy.abort);
  }
}
