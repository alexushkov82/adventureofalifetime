import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

class HiveService {
  Future<void> init() async {
    final appDir = await getApplicationDocumentsDirectory();
    await Hive.initFlutter(appDir.path);
    await Hive.openBox('cart');
  }

  Box get cartBox => Hive.box('cart');
}