/// 常用的邮箱，手机号验证等
class Validator {
  /// 检查是否是邮箱格式
  static bool isValidEmail(String input) {
    /// 邮箱正则
    final String regexEmail =
        "^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*\$";
    if (input == null || input.isEmpty) return false;
    return new RegExp(regexEmail).hasMatch(input);
  }
}
