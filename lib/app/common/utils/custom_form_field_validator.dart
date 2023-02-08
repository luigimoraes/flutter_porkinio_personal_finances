class CustomFormFieldValidator {
  CustomFormFieldValidator._();

  static String? validateName(String? value) {
    final validatedName = RegExp(r'^[a-zA-Z]{2,}(?: [a-zA-Z]+){0,2}$');
    if (value != null && value.isEmpty) {
      return "Name is required";
    }
    if (value != null && !validatedName.hasMatch(value)) {
      return "Please check your name try again.";
    }
    return null;
  }

  static String? validateEmail(String? value) {
    final validatedEmail = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (value != null && value.isEmpty) {
      return "E-mail is required";
    }
    if (value != null && !validatedEmail.hasMatch(value)) {
      return "Please check your e-mail and try again";
    }
    return null;
  }

  static String? validatePassword(String? value) {
    final validatedPassword =
        RegExp(r"^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$");
    if (value != null && value.isEmpty) {
      return "Password is required";
    }
    if (value != null && !validatedPassword.hasMatch(value)) {
      return "Please check your password and try again.";
    }
    return null;
  }

  static String? confirmValidatePassword(String? first, String? second) {
    if (second != null && second.isEmpty) {
      return "Password confirmation is required";
    }
    if (first != second) {
      return "The confirmation doesn't match your password.";
    }
    return null;
  }

  static String? validateNull(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Required field.";
    }
    return null;
  }

  static String? validateTitle(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Title is required";
    }
    if (value.trim().length < 3) {
      return 'Title should contain at least 3 characters';
    }
    return null;
  }
}
