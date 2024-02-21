enum FormType { login, register, number }

class EmailValidator {
  static String validate(String value) {
    return value.isEmpty ? "Email can't be empty" : null;
  }
}

class PasswordValidator {
  static String validate(String value) {
    return value.isEmpty ? "Password can't be empty" : null;
  }
}

class PhoneNumberValidator {
  static String validate(String value) {
    return value.isEmpty ? "Phone Number can't be empty" : null;
  }
}
