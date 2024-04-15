import 'package:flutter/foundation.dart';

class StateModel with ChangeNotifier {
  bool _isExpanded = false;
  bool _isMapOpen = false;
  bool _isDarkMode = false;

  // Getters
  bool get isExpanded => _isExpanded;
  bool get isMapOpen => _isMapOpen;
  bool get isDarkMode => _isDarkMode;
  // Setters

  void toggleInquiryForm() {
    _isExpanded = !_isExpanded;
    notifyListeners();
  }

  void toggleMap() {
    _isMapOpen = !_isMapOpen;
    notifyListeners();
  }

  void toggleDarkMode() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
}
