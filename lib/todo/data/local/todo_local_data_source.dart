

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import '../models/todo.dart';

class TodoLocalDataSource {
  const TodoLocalDataSource();

  static Future<void> initHive() async {
    final appDocumentDirectory = await getApplicationCacheDirectory();
    Hive.init(appDocumentDirectory.path);
  }



}