class Strings {
  static const String appName = 'Milkman';
  static const String user = 'User';
  static String greeting = '${time()}, $user!';
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
