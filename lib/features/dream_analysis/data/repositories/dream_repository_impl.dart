import 'package:dream9frontend/core/error/failures.dart';
import 'package:dream9frontend/features/dream_analysis/data/datasources/remote_data_source.dart';
import 'package:dream9frontend/features/dream_analysis/domain/repositories/dream_repository.dart';
import 'package:fpdart/fpdart.dart';

class DreamRepositoryImpl implements DreamRepository {
  final RemoteDataSource remoteDataSource;

  DreamRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, String>> analyzeDream(String dreamText) async {
    try {
      final analysis = await remoteDataSource.analyzeDream(dreamText);
      return Right(analysis);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}