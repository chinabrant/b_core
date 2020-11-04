import 'dart:io';
import 'dart:convert';

abstract class Cacheable {
  /// 保存路径
  Future<String> path();

  /// 转换成json, 不能包含自定义数据类型
  /// save方法会调这个方法拿要保存的数据
  Map<String, dynamic> toJson();

  /// 子类实现这个方法把数据解析出来
  void loadFromMap(Map<String, dynamic> map);

  /// 从文件加载
  /// 加载成功返回true
  /// 加载失败或文件不存在返回false
  Future<bool> loadFromFile() async {
    File file = File(await path());

    if (file.existsSync()) {
      /// Uint8List
      final data = file.readAsStringSync();

      /// 转成Map
      final mapData = Map<String, dynamic>.from(json.decode(data));
      loadFromMap(mapData);

      return true;
    }

    return false;
  }

  /// 保存
  Future<bool> save() async {
    final map = toJson();
    final jsonString = json.encode(map);

    File file = File(await path());
    if (file.existsSync()) {
      file.deleteSync();
    }

    file.createSync(recursive: true);

    // file.writeAsBytesSync(jsonString.codeUnits, flush: true);
    file.writeAsStringSync(jsonString);

    return true;
  }

  Future<bool> deleteCache() async {
    File file = File(await path());
    if (file.existsSync()) {
      file.deleteSync();
    }

    return true;
  }
}
