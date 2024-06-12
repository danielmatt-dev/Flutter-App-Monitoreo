import 'package:app_plataforma/src/features/promedio/domain/entities/promedio.dart';
import 'package:dartz/dartz.dart';

abstract class PromedioRepository {

  Future<Either<Exception, Promedio>> promedioGlucosa();

  Future<Either<Exception, Promedio>> promedioSistolica();

  Future<Either<Exception, Promedio>> promedioDiastolica();

}