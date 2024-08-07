import 'package:app_plataforma/src/features/doctor/data/data_sources/remote/doctor_remote_datasource.dart';
import 'package:app_plataforma/src/features/doctor/data/data_sources/remote/endpoints/doctor_endpoints.dart';
import 'package:app_plataforma/src/features/doctor/data/models/doctor_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class DoctorRemoteDatasourceImpl extends DoctorRemoteDatasource {
  
  final Dio _dio;

  DoctorRemoteDatasourceImpl(Dio dio): _dio = dio;
  
  @override
  Future<Either<Exception, List<DoctorModel>>> buscarDoctores(String token) async {
    try {
      
      final response = await _dio.get(
        DoctorEndpoints.findAllDoctor,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );

      if(response.statusCode == 200){
        final List<DoctorModel> doctores = (response.data as List).map((json) => DoctorModel.fromJson(json)).toList();
        return Right(doctores);
      }

      return Left(Exception(response.statusMessage ?? 'Doctores no encontrados'));
    } on DioException catch (e) {
      return Left(Exception(e.message));
    } catch (e) {
      return Left(Exception(e.toString()));
    }
    
  }

  @override
  Future<Either<Exception, bool>> validarClaveDoctor(String clave, String token) async {

    try {

      final response = await _dio.post(
        '${DoctorEndpoints.validateClaveDoctor}$clave',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );

      if(response.statusCode == 200){
        return const Right(true);
      }
      return const Right(false);

    } on DioException catch (e) {
      return Left(Exception(e.message));
    } catch (e) {
      return Left(Exception(e.toString()));
    }

  }
  
}