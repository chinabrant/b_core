import 'dart:convert';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';

extension Crypto on String {
  /// MD5 加密
  String md5String() {
    var content = new Utf8Encoder().convert(this);
    var digest = md5.convert(content);
    return hex.encode(digest.bytes);
  }

  /// Base64加密
  String encodeBase64() {
    var content = utf8.encode(this);
    var digest = base64Encode(content);
    return digest;
  }

  /// Base64解密
  String decodeBase64() {
    return String.fromCharCodes(base64Decode(this));
  }
}
