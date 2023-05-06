import 'package:fake_artist/classes/player.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class PlayerDatabase {
  static final PlayerDatabase instance = PlayerDatabase._init();

  static Database? _database;

  PlayerDatabase._init();

  Future<Database> get database async {
    if (_database != null) return database!;

    _database = await _initDB('players.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final stringType = 'TEXT NOT NULL';
    final intType = 'INTEGER NOT NULL';
    await db.execute('''CREATE TABLE $tablePlayer (
          ${PlayerFields.id} $idType, 
          ${PlayerFields.name} $stringType, 
          ${PlayerFields.icon} $stringType, 
          ${PlayerFields.color} $intType)''');
  }

  Future<Player> create(Player player) async {
    final db = await instance.database;

    final id = await db.rawInsert('''
      INSERT INTO $tablePlayer(
        ${PlayerFields.name}, ${PlayerFields.icon}, ${PlayerFields.color}) VALUES 
        (?, ?, ?)''', [player.name, player.icon, player.background.value]);

    return player;
  }

  Future<Player> read(int id) async {
    final db = await instance.database;
    final maps = await db.query(tablePlayer,
        columns: PlayerFields.values,
        where: '${PlayerFields.id} = ?',
        whereArgs: [id]);

    if (maps.isNotEmpty) {
      return Player.fromJson(maps.first);
    } else {
      throw Exception('ID not found');
    }
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}

final String tablePlayer = 'players';

class PlayerFields {
  static final List<String> values = [id, name, icon, color];
  static final String id = '_id';
  static final String name = 'name';
  static final String icon = 'icon';
  static final String color = 'color';
}
