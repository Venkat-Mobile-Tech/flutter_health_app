import 'package:get_it/get_it.dart';

import '../../data/datasources/chat_remote_data_source.dart';
import '../../data/datasources/chat_remote_data_source_impl.dart';
import '../../data/repositories/chat_repository_impl.dart';
import '../../domain/repositories/chat_repository.dart';
import '../../domain/usecases/get_system_responses_usecase.dart';
import '../../presentation/bloc/chat_screen/chat_screen_cubit.dart';
import '../../presentation/bloc/home_screen/home_screen_cubit.dart';

final serviceLocator = GetIt.instance;

Future<void> init() async {
  serviceLocator.registerLazySingleton<ChatRemoteDataSource>(
    () => ChatRemoteDataSourceImpl(),
  );

  serviceLocator.registerLazySingleton<ChatRepository>(
    () => ChatRepositoryImpl(serviceLocator<ChatRemoteDataSource>()),
  );

  serviceLocator.registerLazySingleton(
    () => GetSystemResponseUsecase(serviceLocator<ChatRepository>()),
  );

  serviceLocator.registerLazySingleton(() => HomeScreenCubit());
  serviceLocator.registerLazySingleton(
    () => ChatScreenCubit(serviceLocator<GetSystemResponseUsecase>()),
  );
}
