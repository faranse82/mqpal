class Config {
  final bool isDarkMode;

  Config({this.isDarkMode = false});

  Map<String, dynamic> toJson() {
    return {
      'isDarkMode': isDarkMode,
    };
  }

  factory Config.fromJson(Map<String, dynamic> json) {
    return Config(
      isDarkMode: json['isDarkMode'] ?? false,
    );
  }
}
