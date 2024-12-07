import 'package:app_pokemon/data/database/app_database.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'injectable_config.config.dart';

final GetIt getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() => $initGetIt(getIt);

void setup() {
  getIt.registerSingletonAsync<AppDatabase>(
      () async => await AppDatabase.create());

  print("se registro la base de datos");
}
