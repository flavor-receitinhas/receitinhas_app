import 'package:app_receitas/src/core/services/preference/persistent_database.dart';
import 'package:app_receitas/src/core/services/preference/sembast/store_sembast_enum.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'package:uuid/uuid.dart';

class PersistentDatabaseSembast
    implements PersistentDatabase<StoreSembastEnum> {
  Database? _db;
  final String dbName = 'sembast_v1.db';

  Future<Database> get database => _starting();

  Future<Database> _starting() async {
    if (_db != null) {
      return _db!;
    }
    DatabaseFactory dbFactory = databaseFactoryIo;
    final dir = await getApplicationDocumentsDirectory();
    // We use the database factory to open the database
    _db = await dbFactory.openDatabase(join(dir.path, dbName));
    return _db!;
  }

  @override
  Future<void> delete({
    required String id,
    required StoreSembastEnum store,
  }) async {
    final storeref = StoreRef<String, dynamic>(store.name);
    await storeref.record(id).delete(await database);
  }

  @override
  Future<Map<String, dynamic>?> get({
    required String id,
    required StoreSembastEnum store,
  }) async {
    final storeref = StoreRef<String, dynamic>(store.name);
    return await storeref.record(id).get(await database);
  }

  @override
  Future<void> deleteAll({required StoreSembastEnum store}) async {
    final storeref = StoreRef<String, dynamic>(store.name);
    await storeref.drop(await database);
  }

  @override
  Future<String> create({
    required Map<String, dynamic> objeto,
    required StoreSembastEnum store,
    String? id,
  }) async {
    final storeref = StoreRef<String, dynamic>(store.name);
    id ??= const Uuid().v4();
    objeto['id'] = id;
    await storeref.record(id).put(await database, objeto);
    return id;
  }

  @override
  String get version => throw UnimplementedError();

  @override
  Future<void> update({
    required Map<String, dynamic> objeto,
    required StoreSembastEnum store,
    required String id,
  }) async {
    final storeref = StoreRef<String, dynamic>(store.name);
    await storeref.record(id).put(await database, objeto);
  }

  @override
  Future<List<Map<String, dynamic>>> list({
    where,
    required StoreSembastEnum store,
  }) async {
    final storeref = StoreRef<String, dynamic>(store.name);
    final result = await storeref.find(await database);
    return result.map((e) => Map<String, dynamic>.from(e.value)).toList();
  }
}
