import 'package:flutter_test/flutter_test.dart';
import 'package:mqpal/config.dart';

void main() {
  group('Config', () {
    test('should create a Config object with default values', () {
      final config = Config();
      expect(config.isDarkMode, isFalse);
    });

    test('should create a Config object with provided values', () {
      final config = Config(isDarkMode: true);
      expect(config.isDarkMode, isTrue);
    });

    test('should convert Config object to JSON', () {
      final config = Config(isDarkMode: true);
      final json = config.toJson();
      expect(json, {'isDarkMode': true});
    });

    test('should create a Config object from JSON', () {
      final json = {'isDarkMode': false};
      final config = Config.fromJson(json);
      expect(config.isDarkMode, isFalse);
    });
  });
}
