class Treatment {
  Treatment._();

  static String capitalizeFirstLetter(String input) {
    if (input.isEmpty) {
      return input;
    }
    return input[0].toUpperCase() + input.substring(1);
  }

  static String formathashDoubleNumber(int number) {
    return number.toString().padLeft(3, '0');
  }
}
