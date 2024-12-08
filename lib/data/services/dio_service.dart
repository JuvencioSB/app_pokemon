import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DioService {
  @lazySingleton
  Dio get dio {
    final dio = Dio(BaseOptions(
      baseUrl: 'https://pokeapi.co/api/v2/pokemon/',
      connectTimeout: 5000,
      receiveTimeout: 3000,
    ));
    if (kDebugMode) {
      print('Dio se ha inicializado correctamente');
    }
    return dio;
  }
}
