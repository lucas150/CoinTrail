class AuthValidators {
  // ================= EMAIL =================
  static String? validateEmail(String value) {
    if (value.isEmpty) {
      return 'Email is required';
    }

    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegex.hasMatch(value)) {
      return 'Enter a valid email address';
    }

    return null;
  }

  // ================= USERNAME =================
  static String? validateUsername(String value) {
    if (value.isEmpty) {
      return 'Username is required';
    }

    if (value.length < 3) {
      return 'Username must be at least 3 characters';
    }

    return null;
  }

  // ================= PASSWORD =================
  static String? validatePassword(String value) {
    if (value.isEmpty) {
      return 'Password is required';
    }

    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }

    final hasUpper = RegExp(r'[A-Z]');
    final hasLower = RegExp(r'[a-z]');
    final hasDigit = RegExp(r'\d');

    if (!hasUpper.hasMatch(value)) {
      return 'Password must contain an uppercase letter';
    }

    if (!hasLower.hasMatch(value)) {
      return 'Password must contain a lowercase letter';
    }

    if (!hasDigit.hasMatch(value)) {
      return 'Password must contain a number';
    }

    return null;
  }

  // ================= CONFIRM PASSWORD =================
  static String? validateConfirmPassword(
    String password,
    String confirmPassword,
  ) {
    if (confirmPassword.isEmpty) {
      return 'Confirm your password';
    }

    if (password != confirmPassword) {
      return 'Passwords do not match';
    }

    return null;
  }
}
