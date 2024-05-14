String initialRoute = "/";

class Application {
  static Application? instance;

  static Application getInstance() {
    instance ??= Application();
    return instance!;
  }

  Future<void> initApp() async {}
}
