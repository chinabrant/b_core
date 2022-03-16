import 'package:hive/hive.dart';

/// 本地存储，存储到hive
/// 具体使用可以参考hive
class HiveCache {
  static HiveCache instance = HiveCache._();
  HiveCache._();
  factory HiveCache() {
    return instance;
  }

  late Box _box;
  static const _boxName = 'hive_cache';

  /// 使用前要先调用setup初始化
  Future setup() async {
    _box = await Hive.openBox(_boxName);
  }

  dynamic get(String key) {
    return _box.get(key);
  }

  Future put(String key, dynamic value) async {
    return _box.put(key, value);
  }
}
