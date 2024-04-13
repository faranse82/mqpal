import 'package:flutter/foundation.dart';

class ExpandedProvider with ChangeNotifier {
  bool _isExpanded = false;
  bool get isExpanded => _isExpanded;

  void toggleExpanded() {
    _isExpanded = !_isExpanded;
    notifyListeners();
  }
}
