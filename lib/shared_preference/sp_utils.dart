import 'package:shared_preferences/shared_preferences.dart';

class SPUtils {
  static SharedPreferences _sp;
  static Future<void> setup() async {
    _sp = await SharedPreferences.getInstance();
  }

  static Future<bool> setStringList(String key, List<String> value) async {
    return _sp.setStringList(key, value);
  }

  static dynamic value(Key key) {
    if (!_sp.containsKey(key.name)) {
      /// 不存在的key
      return key.defaultValue;
    }

    if (key.type.isInt) {
      return _sp.getInt(key.name);
    } else if (key.type.isDouble) {
      return _sp.getDouble(key.name);
    } else if (key.type.isString) {
      return _sp.getString(key.name);
    } else if (key.type.isStringList) {
      return _sp.getStringList(key.name);
    } else if (key.type.isBool) {
      return _sp.getBool(key.name);
    }

    print('SPUtils: error 不支持的类型');
    return null;
  }

  static Future<bool> setValue(dynamic value, Key key) async {
    if (value == null) {
      return _sp.remove(key.name);
    }

    if (key.type.isInt) {
      return _sp.setInt(key.name, value as int);
    } else if (key.type.isDouble) {
      return _sp.setDouble(key.name, value as double);
    } else if (key.type.isString) {
      return _sp.setString(key.name, value as String);
    } else if (key.type.isStringList) {
      return _sp.setStringList(key.name, List<String>.from(value));
    } else if (key.type.isBool) {
      return _sp.setBool(key.name, value as bool);
    }

    print('SPUtils: error 不支持的类型2');
    return null;
  }

  /// 此方法只能用于List<String> 类型
  /// 超过长度会将最旧的一条数据移除
  static Future<bool> append(String value, Key key) async {
    List<String> sl = _sp.getStringList(key.name) ?? [];
    while (sl.length > key.length) {
      sl.removeLast();
    }

    if (key.unique) {
      sl.remove(value);
    }

    sl.insert(0, value);

    return _sp.setStringList(key.name, sl);
  }
}

/// 支持的类型
class SupportType {
  final String _name;

  const SupportType(this._name);

  static const SupportType INT = const SupportType('int');
  static const SupportType STRING = SupportType('String');
  static const SupportType DOUBLE = SupportType('double');
  static const SupportType BOOL = SupportType('bool');
  static const SupportType STRING_LIST = SupportType('List<String>');

  bool get isInt => _name == 'int';
  bool get isDouble => _name == 'double';
  bool get isString => _name == 'String';
  bool get isBool => _name == 'bool';
  bool get isStringList => _name == 'List<String>';
}

class Key {
  /// key名称
  String name;

  /// 默认值，可以为null
  dynamic defaultValue;

  /// 这个缓存的类型
  SupportType type;

  /// List<String>类型的最大长度
  int length;

  /// List<String> 里面的值是否要唯一
  bool unique;

  Key({
    this.name,
    this.defaultValue,
    this.type,
    this.length = 1000,
    this.unique = true,
  });
}
