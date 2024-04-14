import 'package:flutter/foundation.dart';

class StateModel with ChangeNotifier {
  bool _isExpanded = false;
  bool _isMapOpen = false;
  bool _isDarkMode = false;
  bool _isSuccessInq = false;
  bool _hasAnswered = false;

  // Getters
  bool get isExpanded => _isExpanded;
  bool get isMapOpen => _isMapOpen;
  bool get isDarkMode => _isDarkMode;
  bool get isSuccessInq => _isSuccessInq;
  bool get hasAnswered => _hasAnswered;
  // Setters

  void toggleInquiryForm() {
    _isExpanded = !_isExpanded;
    notifyListeners();
  }

  void submitInquiryForm() {
    _isSuccessInq = true;
    notifyListeners();
  }

  void toggleConfirmation() {
    _hasAnswered = !hasAnswered;
    notifyListeners();
  }
  void resetInquiryForm() {
    _isSuccessInq = false;
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
