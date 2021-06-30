class Payroll {
  static const rate = 22;
  static final overtime = rate * 1.5;
  static const maxMinutesNormalRate = 2400; // 40 hours

  Payroll();

  double getNetPay(double minutes) {
    double totalNetPay = 0;
    if (minutes > maxMinutesNormalRate) {
      final regularRatePay = rate * (maxMinutesNormalRate / 60);
      final overtimeRatePay = overtime * (minutes - maxMinutesNormalRate) / 60;
      totalNetPay = regularRatePay + overtimeRatePay;
    } else {
      totalNetPay = (Duration(minutes: minutes.toInt()).inHours * 22).toDouble();
    }

    return totalNetPay;
  }
}
