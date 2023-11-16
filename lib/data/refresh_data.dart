class Refresh {
  static bool _refresh = false;

  static void refresh() {
    if (_refresh == false) {
      _refresh = true;
    } else {
      _refresh == false;
    }
  }
}
