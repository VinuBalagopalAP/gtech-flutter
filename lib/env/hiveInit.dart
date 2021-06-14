import 'dart:io';

import 'package:gtech_flutter/core/database/userDB.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

Future<void> hiveInit() async {
  Directory appDocDir = await getApplicationDocumentsDirectory();
  String appDocPath = appDocDir.path;
  Hive.init(appDocPath);

  await UserDB.init();
}
