import 'package:movieapp/model/Cast.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';//para el manejo de rutas
import 'package:path/path.dart';//para el manejo de archivos
import 'dart:io';//para el manejo de archivos

class DBProvider{
  static final DBProvider _dbProvider = new DBProvider();
  //instancia de sqlite para conexion con db
  Database db;
  //al acceder a base de datos locales se hacen llamadas asincronas
  //no se puede hacer llamada asincrona en el constructor
  DBProvider(){
    //siempre se llama en el constructor al instancias la clase
    init();
  }

  static DBProvider get(){
    return _dbProvider;
  }

  //metodo init, se hace aparte porque en un constructor no permite async
  void init() async{
    //definimos el directorio, llamando a esta funcion retornamos el directorio
    //donde almacenamos la bd de manera segura
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    //path final donde guardamos la base de datos
    //join sirve para poder concatenar diferentes paths
    final path = join(documentDirectory.path, "Casts4.db");
    //abrimos la base de datos, la primera vez se crea la db en el dispositivo
    db = await openDatabase(
      path,
      version: 1,//es para que podamos manejar diferentes versiones(que cambian)
      //creamos la estructura principal de la BD, se llama la 1ra vez que accedemos a la bd
      onCreate: (Database newDB, int version){
        newDB.execute("""
          CREATE TABLE Casts(
            id INTEGER PRIMARY KEY,    
            name TEXT,
            profile_path TEXT,
            media_Id INTEGER      
          )        
        """);

      },
    );
  }
  //traemos todos los actores con este metodo, lo maejamos lo mas aislado posible
  Future<List<Cast>> fetchCasts(int mediaId) async{
    print('${mediaId.toString()} lectura de base de datos local');
    var maps = await db.query(
      "Casts",//tabla a consultar
      columns:null,//las columnas a consultar, null=todas
      where: "media_Id = ?",// ?->envia como el argumento lo que esta dentro del whereArgs
      whereArgs: [mediaId]//hacerlo asi es mas seguro, podemos evitar sqlinyection
    );
    if(maps.length > 0){
      //convertimos los datos de la base de datos al modelos de cast
      return maps.map<Cast>((item) => new Cast.fromDb(item)).toList();
    }
    return null;
  }

  //este metodo puede no ser asincrono porque no esperamos respuesta
  //pasamos el parametro cast
  void addCast(Cast cast){
    print('${cast.mediaId.toString()} insertar en base de datos local');
    //prametros tabla, valores, resultado es llave:valor
    db.insert(
      "Casts",
      //tomamos el objeto y lo llevamos al formato de la BD
      cast.toMap(),
      //nos indica si cuando ingresamos un valor tiene conflicto de BD
      //si pasa eso realizamos roolback(regresamos al estado anterior
      //fail arroja una excepcion al usuario con el error
      conflictAlgorithm: ConflictAlgorithm.fail
    );
  }
}