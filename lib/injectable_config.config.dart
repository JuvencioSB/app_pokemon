// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'data/database/app_database.dart' as _i6;
import 'data/repositories/pokemon_repository.dart' as _i5;
import 'data/services/api_service.dart' as _i4;
import 'data/services/dio_service.dart' as _i8;
import 'logic/cubits/pokemon_cubit.dart'
    as _i7; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final dioService = _$DioService();
  gh.singletonAsync<_i6.AppDatabase>(
      () async => await _i6.AppDatabase.create());
  gh.lazySingleton<_i3.Dio>(() => dioService.dio);
  gh.factory<_i4.ApiService>(() => _i4.ApiService(get<_i3.Dio>()));
  gh.factory<_i5.PokemonRepository>(() => _i5.PokemonRepository(
        get<_i4.ApiService>(),
        get<_i6.AppDatabase>(),
      ));
  gh.factory<_i7.PokemonCubit>(
      () => _i7.PokemonCubit(get<_i5.PokemonRepository>()));
  return get;
}

class _$DioService extends _i8.DioService {}
