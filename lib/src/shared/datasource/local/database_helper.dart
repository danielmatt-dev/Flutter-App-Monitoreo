import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {

  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('mediciones_paciente.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {

    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
        path,
        version: 1,
      onCreate: _createDB
    );

  }

  Future _createDB(Database db, int version) async {

    await db.execute('''
    create table mediciones (
      id_configuracion integer primary key autoincrement,
      id_paciente char(6) not null,
      medicion_presion_temprano varchar(20) not null check(medicion_presion_temprano in ('Habilitado', 'Deshabilitado', 'Opcional')),
      medicion_presion_tarde varchar(20) not null check(medicion_presion_tarde in ('Habilitado', 'Deshabilitado', 'Opcional')),
      medicion_presion_noche varchar(20) not null check(medicion_presion_noche in ('Habilitado', 'Deshabilitado', 'Opcional')),
      medicion_glucosa_antes_desayuno integer not null check (medicion_glucosa_antes_desayuno in (0, 1)),
      medicion_glucosa_antes_comida integer not null check (medicion_glucosa_antes_desayuno in (0, 1)),
      medicion_glucosa_dos_horas_despues integer not null check (medicion_glucosa_antes_desayuno in (0, 1)),
      medicion_glucosa_antes_cena integer not null check (medicion_glucosa_antes_desayuno in (0, 1)),
    )
    ''');
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }

}

// <>