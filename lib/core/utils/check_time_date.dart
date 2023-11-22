enum Greeting { morning, afternoon, evening }

class CheckTimeOfDate {
  static Greeting getGreeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return Greeting.morning;
    }
    if (hour < 17) {
      return Greeting.afternoon;
    }
    return Greeting.evening;
  }
}
