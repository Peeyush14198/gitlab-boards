class Validator {
  static String? validateEmptyField(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required.';
    }
  }
}
