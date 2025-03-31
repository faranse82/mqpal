// reads and saves theme state to a config json file which is saved on firebase

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
