/// Use this class to mark which file must be auto exported
class AutoExporter {
  /// Use this class to mark which file must be auto exported
  AutoExporter([String? name]) {
    if (name != null) {
      AutoExporter.name = name;
    }
  }
  static String? name;
}
