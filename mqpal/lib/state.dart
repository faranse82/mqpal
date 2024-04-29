import 'package:flutter/foundation.dart';
import 'package:mqpal/firebase_cloud_storage.dart';
import 'package:mqpal/widgets/inquiry.dart';

class StateModel with ChangeNotifier {
  bool _isExpanded = false;
  bool _isMapOpen = false;
  bool _isDarkMode = false;
  bool _isSuccessInq = false;
  String _userId = '';
  bool _hasAnswered = false;
  List<Inquiry> _inquiries = [];

  // Getters
  bool get isExpanded => _isExpanded;
  bool get isMapOpen => _isMapOpen;
  bool get isDarkMode => _isDarkMode;
  bool get isSuccessInq => _isSuccessInq;
  bool get hasAnswered => _hasAnswered;
  String get userId => _userId;

  List<Inquiry> get inquiries => _inquiries;

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

  void setUserId(String userId) {
    _userId = userId;
    notifyListeners();
  }

  Future<void> loadInquiries() async {
    _inquiries = await FirebaseStorageService.loadInquiriesFromStorage();
    notifyListeners();
  }

  Future<void> addInquiry(Inquiry inquiry) async {
    _inquiries.add(inquiry);
    await FirebaseStorageService.uploadInquiriesToStorage(_inquiries);
    notifyListeners();
  }
}
