import 'package:flutter/foundation.dart';

class StateModel with ChangeNotifier {
  bool _isExpanded = false;
  bool _isMapOpen = false;

  // Getters
  bool get isExpanded => _isExpanded;
  bool get isMapOpen => _isMapOpen;

  // Setters

  void toggleExpanded() {
    _isExpanded = !_isExpanded;
    notifyListeners();
  }

  void toggleMap() {
    // Do something to open a map
    _isMapOpen = !_isMapOpen;
    notifyListeners();
  }
}
