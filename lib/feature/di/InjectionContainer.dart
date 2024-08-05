import 'package:get_it/get_it.dart';
import '../data/api/api_client.dart';
import '../data/repositories/auth_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../presentation/blocs/home/home_bloc.dart';

///[NOTE] : input for [Global] data state
final sl = GetIt.instance;

Future<void> init() async {
  final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  /// [Flavor]
  /// [Implementation] flavor with different [Environm Env] both ios and android
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => ApiClient(sharedPreferences: sl()));

  ///[Core]
  ///

  ///sentry client
  ///

  ///[External]
  ///

  ///[Bloc]
  ///
  // sl.registerFactory(() => HomeBloc(roomRepo: sl(), roomOfflineRepo: sl(), messageOfflineRepo: sl()));
  sl.registerFactory(() => HomeBloc());

  ///[Repository]
  sl.registerFactory(() => AuthRepo(apiClient: sl(), sharedPreferences: sl()));
}
