import 'package:flutter/material.dart';
import 'package:mqpal/config.dart';
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
    saveConfig();
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
    try {
      _inquiries.add(inquiry);
      await FirebaseStorageService.uploadInquiriesToStorage(_inquiries);
      notifyListeners();
    } catch (e) {
      throw Exception('Failed to add inquiry: $e');
    }
  }

  void updateInquiry(Inquiry oldInquiry, Inquiry newInquiry) {
    final index = _inquiries.indexOf(oldInquiry);
    if (index != -1) {
      _inquiries[index] = newInquiry;
      FirebaseStorageService.uploadInquiriesToStorage(_inquiries);
      notifyListeners();
    }
  }

  void popUpMessage(String transaction, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Inquiry $transaction successfully'),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height * 0.75,
          left: MediaQuery.of(context).size.width * 0.05,
          right: MediaQuery.of(context).size.width * 0.05,
        ),
      ),
    );
  }

  Future<void> loadConfig() async {
    final config = await FirebaseStorageService.loadConfigFromStorage();
    _isDarkMode = config.isDarkMode;
    notifyListeners();
  }

  Future<void> saveConfig() async {
    final config = Config(isDarkMode: _isDarkMode);
    await FirebaseStorageService.uploadConfigToStorage(config);
  }
}
