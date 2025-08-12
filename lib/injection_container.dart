import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:dream9frontend/features/dream_analysis/data/datasources/remote_data_source.dart';
import 'package:dream9frontend/features/dream_analysis/data/repositories/dream_repository_impl.dart';
import 'package:dream9frontend/features/dream_analysis/domain/repositories/dream_repository.dart';
import 'package:dream9frontend/features/dream_analysis/domain/usecases/analyze_dream.dart';
import 'package:dream9frontend/features/dream_analysis/presentation/bloc/dream_bloc.dart';
import 'package:dream9frontend/core/utils/speech_utils.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // BLoC
  sl.registerFactory(
    () => DreamBloc(
      useCase: sl(),
      speechUtils: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => AnalyzeDream(sl()));

  // Repository
  sl.registerLazySingleton<DreamRepository>(
    () => DreamRepositoryImpl(remoteDataSource: sl()),
  );

  // Data sources
  sl.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSourceImpl(client: sl()),
  );

  // External
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => SpeechUtils());
}