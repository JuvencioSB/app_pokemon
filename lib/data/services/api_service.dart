import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
class ApiService {
  final Dio _dio;

  ApiService(this._dio) {
    _dio.options.baseUrl = 'https://pokeapi.co/api/v2/';
  }

  Future<Response> getPokemons() async {
    return await _dio.get('pokemon');
  }

  Future<Response> getdatos(String name) async {
    return await _dio.get('pokemon/' + name);
  }
}
