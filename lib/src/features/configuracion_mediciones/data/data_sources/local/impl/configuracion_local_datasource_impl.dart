import 'package:app_plataforma/src/features/configuracion_mediciones/data/data_sources/local/configuracion_local_datasource.dart';
import 'package:app_plataforma/src/features/configuracion_mediciones/data/data_sources/local/sqflite/mediciones_helper.dart';
import 'package:app_plataforma/src/features/configuracion_mediciones/data/models/configuracion_mediciones_model.dart';
import 'package:dartz/dartz.dart';

class ConfiguracionLocalDatasourceImpl extends ConfiguracionLocalDatasource {

  final MedicionesHelper _databaseHelper;

  ConfiguracionLocalDatasourceImpl(this._databaseHelper);

  @override
  Future<Either<Exception, bool>> saveConfiguracion(ConfiguracionMedicionesModel model) async {
    
    try {

      final db = await _databaseHelper.database;
      print('Guardando mediciones');
      return Right((await db.insert('mediciones', model.toJson()) > 0));
      
    } catch (e) {
      return Left(Exception(e.toString()));
    }
    
  }

  @override
  Future<Either<Exception, int>> findIdConfiguracion() async {
    try {

      final db = await _databaseHelper.database;
      final result = await db.query(
          'mediciones',
          columns: ['id_configuracion'],
          orderBy: 'id_configuracion desc',
          limit: 1
      );

      if(result.isEmpty){
        return Left(Exception('Id de configuración no encontrado'));
      }

      return Right(result.first['id_configuracion'] as int);

    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  @override
  Future<Either<Exception, int>> deleteConfiguracion(int idConfiguracion) async {
    
    try {
      
      final db = await _databaseHelper.database;
      return Right(
          await db.delete(
              'mediciones',
              where: 'id_configuracion = ?',
              whereArgs: [idConfiguracion]
          )
      );
      
    } catch (e) {
      return Left(Exception(e.toString()));
    }
    
  }

  @override
  Future<Either<Exception, bool>> clearTable() async {
    try {

      final db = await _databaseHelper.database;
      await db.delete('mediciones');
      return const Right(true);

    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

}