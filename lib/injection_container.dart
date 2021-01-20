import 'package:amirTest/Core/Network/networkInfo.dart';
import 'package:amirTest/Features/Home/Presentation/bloc/home_bloc.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void init() {
  //* ---------------------------------  Feature Home  --------------------------

  // ? Bloc
  sl.registerFactory(() => HomeBloc());

  //*--------------------------------------- External  --------------------------------------

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  sl.registerLazySingleton(() => DataConnectionChecker());
}
