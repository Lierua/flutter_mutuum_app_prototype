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

  static String? addSavingVal(String? value) {
    final v = (value ?? "").trim();

    if (v.isEmpty) {
      return null;
    }

    if (!RegExp(r"^\d+$").hasMatch(v)) {
      return "Opsparing værdien skal være et positivt tal";
    }

    return null;
  }

  static String? addDebtVal(String? value) {
    final v = (value ?? "").trim();

    if (v.isEmpty) {
      return null;
    }

    if (!RegExp(r"^\d+$").hasMatch(v)) {
      return "Supplerende gæld bedes være positivt tal";
    }

    return null;
  }
}
