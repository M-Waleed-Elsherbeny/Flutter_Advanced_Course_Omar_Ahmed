class PasswordRegexValid {
  static bool isPasswordValid(String password) {
    RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    return regex.hasMatch(password);
  }

  static bool hasANumber(String password) {
    RegExp regex = RegExp(r'(?=.*?[0-9])');
    return regex.hasMatch(password);
  }

  static bool hasUpperLetter(String password) {
    RegExp regex = RegExp(r'(?=.*[A-Z])');
    return regex.hasMatch(password);
  }

  static bool hasLowerLetter(String password) {
    RegExp regex = RegExp(r'(?=.*[a-z])');
    return regex.hasMatch(password);
  }

  static bool hasSpecialCharacter(String password) {
    RegExp regex = RegExp(r'(?=.*?[!@#\$&*~])');
    return regex.hasMatch(password);
  }

  static bool hasMinimumLength(String password) {
    RegExp regex = RegExp(r'.{8,}');
    return regex.hasMatch(password);
  }
}
