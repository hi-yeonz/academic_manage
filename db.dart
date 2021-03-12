import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:main_flutter_app/InputScore.dart';

// ignore: non_constant_identifier_names
final TableName = 'memos';

class DBHelper {
  var _db;

  Future<Database> get database async {
    if ( _db != null ) return _db;
    _db = openDatabase(

      // 데이터베이스 경로를 지정합니다. 참고: `path` 패키지의 `join` 함수를 사용하는 것이
      // 각 플랫폼 별로 경로가 제대로 생성됐는지 보장할 수 있는 가장 좋은 방법입니다.

      join(await getDatabasesPath(), 'memos.db'),
      // 데이터베이스가 처음 생성될 때, 표를 저장하기 위한 테이블을 생성합니다.
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE memos(id INTEGER PRIMARY KEY, title TEXT, text TEXT, createTime TEXT, editTime TEXT)",
        );
      },
      // 버전을 설정하세요. onCreate 함수에서 수행되며 데이터베이스 업그레이드와 다운그레이드를
      // 수행하기 위한 경로를 제공합니다.
      version: 1,
    );
    return _db;
  }

  Future<void> insertMemo(Memo memo) async {
    final db = await database;

    // Memo 를 올바른 테이블에 추가하세요. 또한
    // `conflictAlgorithm`을 명시할 것입니다. 본 예제에서는
    // 만약 동일한 memo 가 여러번 추가되면, 이전 데이터를 덮어쓸 것입니다.
    await db.insert(
      TableName,
      memo.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Memo>> memos() async {
    final db = await database;

    // 모든 Memo 를 얻기 위해 테이블에 질의합니다.
    final List<Map<String, dynamic>> maps = await db.query('memos');

    // List<Map<String, dynamic>를 List<Memo>으로 변환합니다.
    return List.generate(maps.length, (i) {
      return Memo(
        test: maps[i]['test'],
        score: maps[i]['score'],
        grade: maps[i]['grade'],
        saveTime: maps[i]['saveTime'],
      );
    });
  }

  Future<void> updateMemo(Memo memo) async {
    final db = await database;

    // 주어진 Memo 를 수정합니다.
    await db.update(
      TableName,
      memo.toMap(),
      // Memo 의 id가 일치하는 지 확인합니다.
      where: "id = ?",
      // Memo 의 id를 whereArg 로 넘겨 SQL injection 을 방지합니다.
      whereArgs: [memo.test],
    );
  }

  Future<void> deleteMemo(int id) async {
    final db = await database;

    // 데이터베이스에서 Memo 를 삭제합니다.
    await db.delete(
      TableName,
      // 특정 memo 를 제거하기 위해 `where` 절을 사용하세요
      where: "id = ?",
      // Memo 의 id를 where 의 인자로 넘겨 SQL injection 을 방지합니다.
      whereArgs: [id],
    );
  }
}


