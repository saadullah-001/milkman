class Strings {
  static const String appName = 'Milkman';
  static const String bio = 'Freshness Delivered Daily';
  static const String appVersion = 'V1.0.0';
  static const String username = 'User';
  static String greeting = '${time()}, $username!';
}

String time() {
  int hour = DateTime.now().hour;
  if (hour < 12) {
    return 'Good Morning';
  } else if (hour < 17) {
    return 'Good Afternoon';
  } else {
    return 'Good Evening';
  }
}
