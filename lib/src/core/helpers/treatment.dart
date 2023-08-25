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

  static String formatDouble(double value) {
    return value.toStringAsFixed(1);
  }

  static String poundsToKilograms(double pounds) {
    double kilograms = pounds / 10.0;
    return '${formatDouble(kilograms)}kg';
  }

  static String metersToCentimeters(double meters) {
    double centimeters = meters * 100;
    return formatDouble(centimeters);
  }

  static String metersToMetersOrCentimeters(double value) {
    if (value >= 10.0) {
      return '${formatDouble(value)}m'.replaceAll(".0", "");
    } else {
      double centimeters = value * 100;
      return '${formatDouble(centimeters)}cm'.replaceAll(".0", "");
    }
  }
}
