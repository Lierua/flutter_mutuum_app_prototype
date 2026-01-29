class AppValidators {
  static String? minChars(String? value, int min, String message) {
    final v = (value ?? "").trim();
    if (v.isEmpty) return message;
    if (v.length < min) return "Mindst $min karakter er påkrævet";
    return null;
  }

  static String? addressDK(String? value) {
    return minChars(value, 3, "Adresse er påkrævet");
  }

  static String? postalCodeDK(String? value) {
    final v = (value ?? "").trim();
    if (v.isEmpty) return "Postnummer er påkrævet";
    if (!RegExp(r"^\d{4}$").hasMatch(v)) return "Postnummer skal være 4 cifre";
    return null;
  }

  static String? countryDK(String? value) {
    return minChars(value, 3, "Et land er påkrævet");
  }
}
